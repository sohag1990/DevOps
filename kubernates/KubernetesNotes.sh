# Hola :-)

###Kubernetes Short notes

#Kubectl = Kubectl is a command line interface for running commands against Kubernetes clusters.
#UI = web-based Kubernetes user interface

##Master = Master components provide the cluster’s control plane. Master components make global decisions about the cluster (for example, scheduling), and they detect and respond to cluster events (for example, starting up a new pod when a replication controller’s replicas field is unsatisfied).
#API Server = Component on the master that exposes the Kubernetes API. It is the front-end for the Kubernetes control plane.
#etcd = Consistent and highly-available key value store used as Kubernetes’ backing store for all cluster data.
#Controller Manager = Component on the master that runs controllers .Logically, each controller is a separate process, but to reduce complexity, they are all compiled into a single binary and run in a single process.
#Scheduler = Component on the master that watches newly created pods that have no node assigned, and selects a node for them to run on

##Worker Node = Node components run on every node, maintaining running pods and providing the Kubernetes runtime environment.
#Kubelet = An agent that runs on each node in the cluster. It makes sure that containers are running in a pod.
#Kube-Proxy = kube-proxy is a network proxy that runs on each node in the cluster.kube-proxy is responsible for request forwarding. kube-proxy allows TCP and UDP stream forwarding or round robin TCP and UDP forwarding across a set of backend functions.
#Pod = A Pod (as in a pod of whales or pea pod) is a group of one or more containers (such as Docker containers), with shared storage/network, and a specification for how to run the containers. A Pod’s contents are always co-located and co-scheduled, and run in a shared context. Containers within a Pod share an IP address and port space, and can find each other via localhost. 
#Docker Container = A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

##Kubelet
# >Motiors API Server for changes
# >Responsible for Pod Lifecycle
# >Reports Node & Pod State
# >Pod liveness Probes

##Kube-proxy
# >Network proxy iptables
# >Implements Services
# >Routing traffic to pods
# > Load Banlancing

##Container runtime
# >Downloads images and runs containers
# >Container Runtime interface
# >Docker
# >Many others container


##Scheduled/Add-on pods
# >DNS: to manage DNS
# >Ingress: Loadbanancing
# >Dashboard: administrative Dashboard


############
# > All Pods can communicate with each other on all nodes
# > All Nodes can communicate with all Pods
# > No network Address Translation(NAT)
############
# Default 
# API Port : 6443 All 
# etcd Port: 2379-2380  API/etcd
# Scheduler Port: 10251 Self
# Controller Manager Port: 10252 selft
# kubelet port: 10250 Control plane
# 
# NodePort 30000-32767 All



