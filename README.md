# kube-prometheus-stack 

## 服务修改项目

### alter 告警规则

```
./kube-prometheus-stack/kube-prometheus-stack/templates/prometheus/rules-1.14
```
### 自定义的 ServiceMonitor

- 在 values.yaml 文件

```
    additionalServiceMonitors:
    - name: jmx-monitor
        selector:
        matchLabels:
            app: jmx
        endpoints:
        - bearerTokenFile: /var/run/secrets/kubernetes.io/serviceaccount/token
        honorLabels: true
        interval: 10s
        path: /metrics
        port: jmx
        scheme: http
        tlsConfig:
            insecureSkipVerify: true
        jobLabel: jmx-monitor
        namespaceSelector:
        matchNames:
        - t1
        - t2
        - t3  
    - name: nginx-monitor
        selector:
        matchLabels:
            app: vts
        endpoints:
        - bearerTokenFile: /var/run/secrets/kubernetes.io/serviceaccount/token
        honorLabels: true
        interval: 10s
        path: /vts/format/prometheus
        port: vts
        scheme: http
        tlsConfig:
            insecureSkipVerify: true
        jobLabel: nginx-monitor
        namespaceSelector:
        matchNames:
        - t1
        - t2
        - t3  
```

### prometheusalert 和 grafana 直接集成到了 kube-prometheuses-stack 中

```
    放到 charts 目录结构下就可以了

    svc ：prometheusalert -> kube-prometheus-stack-prometheusalert
```

### grafana 的模式 从 deployment -> sts，持久化存储，方便保存 dashboard

```
    persistence:
      type: sts

    useStatefulSet: true
```

### 主配置文件中禁用 grafana 的 datasources

```
grafana:

    datasources:
      enabled: false
```

### grafana-dashboard ：存放 grafana 监控模版
