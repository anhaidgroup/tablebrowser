.. _user:

***********
User Manual
***********

Overview
========

Cloud browser is a tool for easy visualization of large csv files. This tool allows you to upload csv files and view
them as a map i.e. perform pan and zoom operations through UI. Cloud browser processes csv files on the fly and has a
low latency for initial loading and browsing as compared to traditional tools such as Apple Numbers and Microsoft Excel.
It is available as a micro-cloud service, hence can be hosted in one place and then the users do not need to worry about
any requirements or dependencies other than a web browser.

Requirements Summary
====================

Cloud browser is configured to use a maximum of 30 GB of disk space. This tool has been tested on Ubuntu 16.04 but
should be compatible with other versions. In order to set up cloud browser on a host, a python 3.5.0 or newer environment 
will be required which could be native, virtual or a container. Python pip is required for installing dependencies.
Wkhtmltopdf 0.12.3 package needs to be installed on the machine. Write permissions are required on the 'media' folder 
where temporary data will be stored.

Installation
============

* Login to the ec2 console and launch an ec2 instance. We recommend using the m5.large ec2 instance with ubuntu 16.04. The application
should work on other instance types but may run slower on the burstable t-series instance types.

* When you create the instance, you will get a key pair which you should save to some location on your local machine

* Go to the "Network & Security" menu of your ec2 instance. Find the security group that your instance is part of. Click
on "Inbound rules". Use the dropdown and add HTTP (port 80).

* Change permissions for the private key ::

    chmod 400 /path_to_key/my_key.pem

* Note the public dns name for your ec2 instance from the ec2 instance dashboard

* SSH into your ec2 instance using the downloaded key ::
    
    ssh -i /path_to_key/my_key.pem ec2-user@public_dns_name

* Install docker ::

    sudo yum install -y docker

* Start Docker service ::

    sudo service docker start

* Run the docker container ::
    
    sudo docker run -p 8000:8000 kaushikc92/magicktable:v5

* Install and start nginx ::
    
    sudo yum install nginx
    sudo service nginx start

* Edit the nginx configs ::

    sudo vi /etc/nginx/conf.d/virtual.conf

with the following content (Replace #PUBLIC_DNS with the actual public dns) ::

    server {
        listen  80;
        server_name    #PUBLIC_DNS;
        location / {
            proxy_pass http://127.0.0.1:8000;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_connect_timeout       600;
            proxy_send_timeout          600;
            proxy_read_timeout          600;
            send_timeout                600;
        }
    }

* Restart Nginx server ::

    sudo service nginx restart

* You can now use the tool by opening a web browser and typing the public dns name

* You can stop (or terminate) the service from the EC2 instance dashboard. Select your EC2 instance, click on "Actions"
and then click on stop (or terminate)


Usage
=====

This tool is pretty straight forward to use. The index page opens up a file manager portal where you can upload a csv
file, choose to browse one of the csv files already uploaded, delete a file or download a file. Clicking on the csv file
will open the file in a map window where you can use pan and zoom operations to browse it. A slider is available to the
right of the map window which can be used to quickly jump to any portion of a large csv file.
