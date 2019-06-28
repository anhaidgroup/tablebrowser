FROM python:3

#RUN apt-get update -y && apt-get install -y nginx

#COPY nginx.conf /etc/nginx

# install wkhtmltoimage
RUN cd ~
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
RUN tar vxf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz 
RUN cp wkhtmltox/bin/wk* /usr/local/bin/

RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN pip install gunicorn

COPY ./src/ /code/
# Remove this!
RUN chmod -R 777 media

# Make port 8000 available to the world outside this container
EXPOSE 8000

#CMD python manage.py makemigrations && python manage.py migrate && service nginx start && gunicorn -b 0.0.0.0:8000 magicktable.wsgi
CMD python manage.py makemigrations && python manage.py migrate && gunicorn -b 0.0.0.0:8000 magicktable.wsgi
