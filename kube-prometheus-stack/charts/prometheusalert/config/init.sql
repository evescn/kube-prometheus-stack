INSERT INTO `prometheus_alert_d_b` VALUES ('50', 'wx', 'Prometheus', 'prometheus-wxdayuan1997', '
{{ $var := .externalURL}}{{ range $k,$v:=.alerts }}
{{if eq $v.status "resolved"}}
# Prometheus恢复信息
> <font color="info">告警名称</font>：{{$v.labels.alertname}}
> <font color="info">告警级别</font>：{{$v.labels.severity}}
> <font color="info">开始时间</font>：{{GetCSTtime $v.startsAt}}
> <font color="info">结束时间</font>：{{GetCSTtime $v.endsAt}}
> <font color="info">故障主机</font>：{{$v.labels.instance}}
**{{$v.annotations.summary}}**
{{else}}# Prometheus告警信息
> <font color="warning">告警名称</font>：{{$v.labels.alertname}}
> <font color="warning">告警级别</font>：{{$v.labels.severity}}
> <font color="warning">开始时间</font>：{{GetCSTtime $v.startsAt}}
> <font color="warning">结束时间</font>：{{GetCSTtime $v.endsAt}}
> <font color="warning">故障主机</font>：{{$v.labels.instance}}
**{{$v.annotations.summary}}**
{{end}}
{{ end }}
', '2023-04-27 11:30:00');
