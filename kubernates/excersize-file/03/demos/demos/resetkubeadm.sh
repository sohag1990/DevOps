# To reset kubeadm and remove the previous initialization
# To prepare for the kubeadm init again
kubeadm reset
ipvsadm --clear
mv /var/lib/etcd/ ./
rm -rf $HOME/.kube
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X