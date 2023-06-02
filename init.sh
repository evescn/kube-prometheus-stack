#!/bin/bash

## ETCD 启用了证书认证，所以获取 ETCD /metrics 接口时，需要使用 ETCD 的 ssl 证书
## 登陆 master 节点主机，执行以下命令，配置 ETCD 证书到 secret 中，方便后续 pod 使用访问 ETCD 数据

kubectl -n monitoring create secret generic etcd-certs --from-file=/etc/kubernetes/ssl/ca.pem --from-file=/etc/kubernetes/ssl/etcd.pem --from-file=/etc/kubernetes/ssl/etcd-key.pem