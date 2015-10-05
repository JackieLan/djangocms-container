# djangocms-container
A container to run and develop django cms project with nginx, uwsgi

Quickstart:
===

1. build docker container
 `docker build -t djangocms-container .`

2. Run docker container
 `docker run -p 80 -d djangocms-container`

More:
===

1. You can mount a logging volume to save log file to host OS
 `docker run -p 80 -d -v /your/logging/file/volume/in/host/os:/var/log/nginx --net=host djangocms-container`

2. Specify a local volume to run a specific application
 `docker run -p 80 -d -e MODULE=myapp -v /your/app/folder/in/host/os:/django/app djangocms-container`

3. Use djangocms-container to develop your applications
 `docker run -p 80 -i -t -e MODULE=myapp -v /your/app/folder/in/host/os:/django/app --net=host djangocms-container bash`

   Inside the docker container, you could run the following commands to easily create and run your own app project, here is one example

 `root@:/# cd /django/app`
 `root@:/django/app# django-admin startproject myapp .`
 `root@:/django/app# cd ..`
 `root@:/django# sh ./run.sh`

   Then, you can use web browser to visit the http://hostOSIP to check your own app.

   Finally, when the application is updated, you can refer to step 2 to your own application
