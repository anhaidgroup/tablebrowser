FROM python:3

RUN apt-get update && apt-get install -y vim

RUN cd ~
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
RUN tar vxf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz 
RUN cp wkhtmltox/bin/wk* /usr/local/bin/

RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY ./src/ /code/
EXPOSE 8000

CMD mkdir -p /storage/media/tiles && python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000
