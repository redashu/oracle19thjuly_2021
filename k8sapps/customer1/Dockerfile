FROM oraclelinux:8.4
LABEL email="ashutoshh@linux.com"
ENV deploy=hello
# creating env variable with hello value 
#  MYSQL_ROOT_PASSWORD 
RUN dnf install httpd -y
RUN mkdir /myapps  /myapps/app1  /myapps/app2 /myapps/app3
COPY app1  /myapps/app1/
COPY app2  /myapps/app2/
COPY app3  /myapps/app3/
COPY deploy.sh  /myapps/
WORKDIR  /myapps
RUN chmod +x deploy.sh 
# making script executable 
EXPOSE 80 
# it define default port of your app server (optional)
ENTRYPOINT  ["./deploy.sh"]
