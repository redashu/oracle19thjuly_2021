FROM alpine
LABEL  name="ashutoshh singh"
LABEL email="ashutoshh@linux.com"
RUN apk add python3  
# in alpine linux software installer is apk 
RUN  mkdir /code
COPY hello.py  /code/hello.py
CMD ["python3","/code/hello.py"]