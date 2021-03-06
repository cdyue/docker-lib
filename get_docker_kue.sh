#!/bin/bash
namespace=docker-all.repo.ebaotech.com/libac
images=(kube-proxy-amd64:v1.7.12 kube-scheduler-amd64:v1.7.12 kube-controller-manager-amd64:v1.7.12 kube-apiserver-amd64:v1.7.12 etcd-amd64:3.0.17 pause-amd64:3.0 kubernetes-dashboard-amd64:v1.7.1 k8s-dns-sidecar-amd64:1.14.5 k8s-dns-kube-dns-amd64:1.14.5 k8s-dns-dnsmasq-nanny-amd64:1.14.5)

for imageName in ${images[@]} ; do
  docker pull $namespace/$imageName
  docker tag $namespace/$imageName gcr.io/google_containers/$imageName
  docker rmi $namespace/$imageName
done
