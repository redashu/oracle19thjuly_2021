# checking cluster status 

```
❯ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

❯ kubectl  config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
          minikube                      minikube     minikube           default
❯ kubectl  config use-context  kubernetes-admin@kubernetes
Switched to context "kubernetes-admin@kubernetes".
❯ kubectl  config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
          minikube                      minikube     minikube           default
❯ kubectl  get  nodes
NAME         STATUS   ROLES                  AGE   VERSION
masternode   Ready    control-plane,master   24h   v1.21.3
minion1      Ready    <none>                 24h   v1.21.3
minion2      Ready    <none>                 24h   v1.21.3

```

## Namespace concept 

<img src="ns.png">

## k8s having 4 namespaces by default 

```
❯ kubectl  config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
          minikube                      minikube     minikube           default
❯ kubectl  get  namespaces
NAME                   STATUS   AGE
default                Active   24h
kube-node-lease        Active   24h
kube-public            Active   24h
kube-system            Active   24h
kubernetes-dashboard   Active   18h
❯ 
❯ kubectl  config  use-context minikube
Switched to context "minikube".
❯ kubectl  get  no
NAME       STATUS   ROLES                  AGE   VERSION
minikube   Ready    control-plane,master   18h   v1.21.2
❯ kubectl  get  ns
NAME              STATUS   AGE
default           Active   18h
kube-node-lease   Active   18h
kube-public       Active   18h
kube-system       Active   18h

```

### 4 namespaces explaination 

<img src="ns1.pnh">

## component of master and minion 

```
❯ kubectl  get  po -n  kube-system
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-78d6f96c7b-rtwvd   1/1     Running   2          24h
calico-node-c9n9s                          1/1     Running   2          24h
calico-node-pzd94                          1/1     Running   2          24h
calico-node-z4ngn                          1/1     Running   2          24h
coredns-558bd4d5db-gkvfq                   1/1     Running   2          25h
coredns-558bd4d5db-lpnn5                   1/1     Running   2          25h
etcd-masternode                            1/1     Running   2          25h
kube-apiserver-masternode                  1/1     Running   2          25h
kube-controller-manager-masternode         1/1     Running   2          25h
kube-proxy-m2m4s                           1/1     Running   2          24h
kube-proxy-ps4zb                           1/1     Running   2          25h
kube-proxy-r7qck                           1/1     Running   2          25h
kube-scheduler-masternode                  1/1     Running   2          25h

```

### creating namespace

```
❯ kubectl  create  namespace  ashu-space
namespace/ashu-space created
❯ kubectl  get  ns
NAME                   STATUS   AGE
amar-space             Active   1s
ashu-space             Active   14s
default                Active   25h
kube-node-lease        Active   25h
kube-public            Active   25h
kube-system            Active   25h

```

### deploy pod in custom namespace 

```
❯ kubectl  get  po
No resources found in default namespace.
❯ kubectl  get  po -n ashu-space
NAME          READY   STATUS    RESTARTS   AGE
ashupod-123   1/1     Running   0          18s
❯ kubectl  get  po -o wide -n ashu-space
NAME          READY   STATUS    RESTARTS   AGE   IP              NODE      NOMINATED NODE   READINESS GATES
ashupod-123   1/1     Running   0          26s   192.168.34.38   minion1   <none>  

```

## setting default namespace 

```
kubectl  config  set-context  --current --namespace=ashu-space

```

## auto generate yaml / json 

```
kubectl run  webapp1  --image=dockerashu/ashuoracleweb:v111  --port=80  --dry-run=client -o yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: webapp1
  name: webapp1
spec:
  containers:
  - image: dockerashu/ashuoracleweb:v111
    name: webapp1
    ports:
    - containerPort: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  
  
```

### saving output in yaml file

```
kubectl run  webapp1  --image=dockerashu/ashuoracleweb:v111  --port=80  --dry-run=client -o yaml  >ashuapp1.yaml

```

### deploying pod 

```
ashuapp1.json ashuapp1.yaml ashupod1.yaml customer1
❯ kubectl  apply -f ashuapp1.yaml
pod/webapp1 created
❯ kubectl  get  po
NAME          READY   STATUS              RESTARTS   AGE
ashupod-123   1/1     Running             0          108m
webapp1       0/1     ContainerCreating   0          5s
❯ kubectl  get  po
NAME          READY   STATUS    RESTARTS   AGE
ashupod-123   1/1     Running   0          108m
webapp1       1/1     Running   0          17s
❯ kubectl  get  po -o wide
NAME          READY   STATUS    RESTARTS   AGE    IP                NODE      NOMINATED NODE   READINESS GATES
ashupod-123   1/1     Running   0          108m   192.168.34.38     minion1   <none>           <none>
webapp1       1/1     Running   0          23s    192.168.179.232   minion2   <none>           <none>

```

### history 

```
1324  kubectl version 
 1325* kubectl run  webapp1  --image=dockerashu/ashuoracleweb:v111  --port=80  --dry-run=client -o yaml
 1326* kubectl run  webapp1  --image=dockerashu/ashuoracleweb:v111  --port=80  --dry-run=client -o json 
 1327* history
 1328* kubectl run  webapp1  --image=dockerashu/ashuoracleweb:v111  --port=80  --dry-run=client -o yaml  >ashuapp1.yaml
 1329* kubectl run  webapp1  --image=dockerashu/ashuoracleweb:v111  --port=80  --dry-run=client -o json  >ashuapp1.json
 1330* ls
 1331* kubectl  apply -f ashuapp1.yaml 
 1332* kubectl  get  po 
 1333* kubectl  get  po -o wide

```

