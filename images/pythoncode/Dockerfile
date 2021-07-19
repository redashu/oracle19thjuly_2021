FROM python
# We are going to user python docker image
# it will be pulled from Docker hub if not present 
# in Docker engine host 
LABEL  name="ashutoshh singh"
LABEL email="ashutoshh@linux.com"
# just info about image designer 
# this field is optional 
RUN  mkdir /code
# during image build time it will give you 
# container shell access like docker exec -it 
COPY hello.py  /code/hello.py
# copy data from docker client machine to
# docker engine during build time 
# its like docker cp -- 
CMD ["python","/code/hello.py"]
# its the default process of docker image
# so during container creation time automatically 
# this process will be choosen..
# docker run -itd --name x1 alpine ping localhost 


