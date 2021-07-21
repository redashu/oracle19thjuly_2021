# Revision 

<img src="sn.png">


## COnfigure Docker engine in TCP socket 

```
[root@ip-172-31-70-200 ~]# cd  /etc/sysconfig/
[root@ip-172-31-70-200 sysconfig]# ls
acpid       clock     docker          init        modules          nfs            rpcbind      run-parts  sysstat.ioconf
atd         console   docker-storage  irqbalance  netconsole       raid-check     rpc-rquotad  selinux
authconfig  cpupower  grub            keyboard    network          rdisc          rsyncd       sshd
chronyd     crond     i18n            man-db      network-scripts  readonly-root  rsyslog      sysstat
[root@ip-172-31-70-200 sysconfig]# cat  docker
# The max number of open files for the daemon itself, and all
# running containers.  The default value of 1048576 mirrors the value
# used by the systemd service unit.
DAEMON_MAXFILES=1048576

# Additional startup options for the Docker daemon, for example:
# OPTIONS="--ip-forward=true --iptables=true"
# By default we limit the number of open files per container
OPTIONS="--default-ulimit nofile=1024:4096 -H tcp://0.0.0.0:2375"

# How many seconds the sysvinit script waits for the pidfile to appear
# when starting the daemon.
DAEMON_PIDFILE_TIMEOUT=10

```

## alternative to this  above

```
[root@ip-172-31-70-200 docker]# pwd
/etc/docker
[root@ip-172-31-70-200 docker]# ls
deamon.json  key.json
[root@ip-172-31-70-200 docker]# cat  deamon.json 
{

 "hosts": ["tcp://192.168.59.3:2375"]
}
[root@ip-172-31-70-200 docker]# 



```


### starting docker engine 

```
 systemctl daemon-reload  ; systemctl restart docker

```

## cleaning up docker engine 

```
70  docker  rm $(docker ps -aq) -f ; docker network prune 
  371  docker  network ls
  372  history 
  373  docker  rmi $(docker images -q) -f
  374  docker  images
  375  docker  ps -a
  376  docker network ls
  377  docker volume rm $(docker volume ls -q) -f
  378  docker  volume  ls
  379  docker  images ; docker ps -a ; docker network ls ; docker volume  ls
  
  ```
  
  ### docker volume 
  
  ```
  [ec2-user@ip-172-31-70-200 images]$ 
[ec2-user@ip-172-31-70-200 images]$ docker  volume  create ashuvol1 
ashuvol1
[ec2-user@ip-172-31-70-200 images]$ docker  volume ls 
DRIVER    VOLUME NAME
local     ashuvol1
[ec2-user@ip-172-31-70-200 images]$ docker  volume inspect  ashuvol1 
[
    {
        "CreatedAt": "2021-07-21T05:22:32Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/ashuvol1/_data",
        "Name": "ashuvol1",
        "Options": {},
        "Scope": "local"
    }
]


```

### mysql as container 

<img src="db.png">

## login into DB container to access DB engine 

```
[ec2-user@ip-172-31-70-200 images]$ docker  exec -it  ashudb bash 
root@72adfff19ab2:/# cat  /etc/os-release 
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@72adfff19ab2:/# 
root@72adfff19ab2:/# mysql  -u  root  -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.26 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 
mysql> 
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> create  database ashuDB ; 
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ashuDB             |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> 

```

## Bind Mount in COntainers 

<img src="bindm.png">

## example

```
[ec2-user@ip-172-31-70-200 images]$ docker  run -it --rm  -v  /etc:/mydata:ro  oraclelinux:8.3  bash 
Unable to find image 'oraclelinux:8.3' locally
8.3: Pulling from library/oraclelinux
dd34f38d274c: Pull complete 
Digest: sha256:af3182ee6c1e56f18fc1fecaf638da57d7c47233862e5c32f5ad723a6ab4c6db
Status: Downloaded newer image for oraclelinux:8.3
[root@9d24da521f69 /]# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  mydata  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@9d24da521f69 /]# cd mydata/
[root@9d24da521f69 mydata]# mkdir hello
mkdir: cannot create directory 'hello': Read-only file system
[root@9d24da521f69 mydata]# ls
DIR_COLORS               cron.monthly         hibinit-config.cfg  mke2fs.conf        python            skel
DIR_COLORS.256color      cron.weekly          host.conf           modprobe.d         rc.d              ssh
DIR_COLORS.lightbgcolor  crontab              hostname            modules-load.d     rc.local          ssl
GREP_COLORS              csh.cshrc            hosts               motd               rc0.d             statetab
GeoIP.conf               csh.login            hosts.allow         mtab               rc1.d             statetab.d
GeoIP.conf.default       dbus-1               hosts.deny          my.cnf             rc2.d             subgid
NetworkManager           default              id

```

### Portainer with Docker bind mount 

```
docker  run -itd --name webui --restart always -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock  portainer/portainer:latest 

```

## COntainer RUn time Engine problems 

<img src="prob.png">

## Container orchestration engine 

<img src="carch.png">

## Introduction to k8s 

<img src="k8s1.png">


## k8s arch level 1 

<img src="k8s2.png">

## k8s solved scheduling of containers problem 

<img src="ksch.png">

## replication controller 

<img src="rc.png">

### RC 

<img src="rc1.png">

## Node controller 

<img src="nc1.png">

## nc again 

<img src="nc2.png">




