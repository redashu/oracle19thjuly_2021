#!/bin/bash

if  [ "$deploy" ==  "app1"   ]
then
    cp -rf /myapps/app1/*  /var/www/html/
    httpd -DFOREGROUND
elif [ "$deploy" ==  "app2"   ]
then
   cp -rf /myapps/app2/*  /var/www/html/
    httpd -DFOREGROUND
elif [ "$deploy" ==  "app3"   ]
then
   cp -rf /myapps/app3/*  /var/www/html/
    httpd -DFOREGROUND
else 
    echo  "HEllo you need to check with Docker image builder team" >/var/www/html/index.html
    httpd -DFOREGROUND

fi