# discussion 

<img src="plan.png">

## problem in history based method to deploy and test any application 

<img src="prob.png">

## we got solution of app incompatible problem by Hypervisor 

<img src="vms.png">

## Os in vm means extra lib and resources 

<img src="vmprob.png">


## OS has these things in one shot

<img src="os.png">

## introduction to containers

<img src="cont.png">

## COntainers 

<img src="cont1.png">

## VM vs contianer engines 

<img src="conte.png">

## More info about Docker 

<img src="docker.png">

## Docker installation 

<img src="dd.png">


### Manual installing docker in linux vm 

```
  1  docker  version 
    2  yum  install  docker  -y
    3  for  i  in  avijit krushan mamta nurul phalani ravindra satyendra srini ; do useradd  $i ; echo "DockerOr099#"  |  pa
sswd  $i --stdin ; usermod -aG docker $i; done 
    4  ls /home
    5  vim /etc/ssh/sshd_config 
    6  systemctl restart sshd
    7  systemctl start  docker 
    8  systemctl status  docker 
    9  systemctl enable  docker 
    
 ```
 
 ## Understanding docker architecture 
 
 <img src="darch.png">
 
 ## docker usage docker hub by default 
 
 <img src="hub.png">
 
 ## Pulling docker iamges from docker hub 
 
 ```
 [ec2-user@ip-172-31-70-200 ~]$ docker  pull  openjdk 
Using default tag: latest
latest: Pulling from library/openjdk
c828c776e142: Pull complete 
8846dac42cae: Pull complete 
ede633318f42: Pull complete 
Digest: sha256:9667ee3dbe03be6b41ae9e855f0dbf9f2ac2b78a50a3a8b983484aeab70bdf24
Status: Downloaded newer image for openjdk:latest
docker.io/library/openjdk:latest
[ec2-user@ip-172-31-70-200 ~]$ docker  images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
openjdk       latest    f695f4f55ff0   6 days ago    467MB
oraclelinux   8.4       845809d06ce6   6 days ago    247MB
debian        latest    7a4951775d15   3 weeks ago   114MB
[ec2-user@ip-172-31-70-200 ~]$ 

```

## container life cycle is life of app / script / code 

<img src="lifec.png">

## docker images stored in docker host side

<img src="image.png">

## creating first container 

<img src="c1.png">

## list of all running containers

```
[ec2-user@ip-172-31-70-200 ~]$ docker  ps
CONTAINER ID   IMAGE           COMMAND            CREATED          STATUS          PORTS     NAMES
54a8dabb04c7   alpine:latest   "ping 127.0.0.1"   47 seconds ago   Up 46 seconds             mamtac1
0d44ac7073bb   alpine:latest   "ping 127.0.0.1"   2 minutes ago    Up 2 minutes              ashuc1
c240dd2a3187   alpine:latest   "ping localhost"   4 minutes ago    Up 4 minutes              avijc1
09e4690634aa   alpine          "ping localhost"   25 minutes ago   Up 25 minutes             x1

```

### checking output of a running container 

```
 53  docker  ps
   54  docker  logs  ashuc1
   55  docker  logs  -f  ashuc1
   
```

### stopping a running container 

```
[ec2-user@ip-172-31-70-200 ~]$ docker  stop  ashuc1   
ashuc1
[ec2-user@ip-172-31-70-200 ~]$ docker  ps
CONTAINER ID   IMAGE            COMMAND            CREATED          STATUS          PORTS     NAMES
c4bbd17670c2   alpine:latest    "ping 127.0.0.1"   4 minutes ago    Up 4 minutes              phpaladu1
737512bcf2c3   alpine:latest    "ping 127.0.0.1"   5 minutes ago    Up 5 minutes              srini
530a153bddc4   busybox:latest   "ping localhost"   5 minutes ago    Up 5 minutes              avijc2
8b23d07aac19   alpine:latest    "ping 127.0.0.1"   6 minutes ago    Up 6 minutes              deepa
e41f39da3e2a   alpine:latest    "ping 127.0.0.1"   6 minutes ago    Up 6 minutes              krushna1
548a903d1cf3   ubuntu:14.04     "ping 127.0.0.1"   6 minutes ago    Up 6 minutes              satya
54a8dabb04c7   alpine:latest    "ping 127.0.0.1"   7 minutes ago    Up 7 minutes              mamtac1
c240dd2a3187   alpine:latest    "ping localhost"   11 minutes ago   Up 11 minutes             avijc1

```

### starting a container 

```
[ec2-user@ip-172-31-70-200 ~]$ docker  ps -a
CONTAINER ID   IMAGE            COMMAND                 CREATED          STATUS                        PORTS      NAMES
c4bbd17670c2   alpine:latest    "ping 127.0.0.1"        5 minutes ago    Up 5 minutes                             phpaladu1
737512bcf2c3   alpine:latest    "ping 127.0.0.1"        5 minutes ago    Up 5 minutes                             srini
530a153bddc4   busybox:latest   "ping localhost"        6 minutes ago    Up 6 minutes                             avijc2
8b23d07aac19   alpine:latest    "ping 127.0.0.1"        6 minutes ago    Exited (137) 35 seconds ago              deepa
e41f39da3e2a   alpine:latest    "ping 127.0.0.1"        7 minutes ago    Up 7 minutes                             krushna1
548a903d1cf3   ubuntu:14.04     "ping 127.0.0.1"        7 minutes ago    Up 7 minutes                             satya
54a8dabb04c7   alpine:latest    "ping 127.0.0.1"        8 minutes ago    Up 8 minutes                             mamtac1
0d44ac7073bb   alpine:latest    "ping 127.0.0.1"        9 minutes ago    Exited (137) 50 seconds ago              ashuc1
c240dd2a3187   alpine:latest    "ping localhost"        12 minutes ago   Up 12 minutes                            avijc1
c9759da887e1   tomcat           "x1 'ping localhost'"   24 minutes ago   Created                       8080/tcp   thirsty_proskuriakova
09e4690634aa   alpine           "ping localhost"        32 minutes ago   Up 32 minutes                            x1
79581fbe2d70   fedora           "/bin/bash"             35 minutes ago   Up 34 minutes                            charming_kare
[ec2-user@ip-172-31-70-200 ~]$ docker  start  ashuc1
ashuc1
[ec2-user@ip-172-31-70-200 ~]$ docker  ps 
CONTAINER ID   IMAGE            COMMAND            CREATED          STATUS          PORTS     NAMES
c4bbd17670c2   alpine:latest    "ping 127.0.0.1"   5 minutes ago    Up 5 minutes       

```

### access shell of a running container 

```
[ec2-user@ip-172-31-70-200 ~]$ docker  exec  -it   ashuc1  sh 
/ # uname
Linux
/ # whoami
root
/ # cat  /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.14.0
PRETTY_NAME="Alpine Linux v3.14"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
/ # ls  /
bin    etc    lib    mnt    proc   run    srv    tmp    var
dev    home   media  opt    root   sbin   sys    usr
/ # exit

```


