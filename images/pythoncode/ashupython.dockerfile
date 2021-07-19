FROM oraclelinux:8.3 
LABEL  name="ashutoshh singh"
LABEL email="ashutoshh@linux.com"
RUN dnf install python3 -y 
RUN  mkdir /code
COPY hello.py  /code/hello.py
CMD ["python3","/code/hello.py"]