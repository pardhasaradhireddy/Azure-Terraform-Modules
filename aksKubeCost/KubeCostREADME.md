                                                        KubeCost

# With Kubecost, companies can easily monitor costs specific to the operation of any Kubernetes cluster (memory, CPU, etc.) in real time. Users can manage costs at cluster level or consolidate by application, project, team, or department.



# How to deploy KubeCost

You can  install directly with the Kubecost Helm Chart with Helm v3.1+ using the following commands.

helm upgrade --install kubecost \
  --repo https://kubecost.github.io/cost-analyzer/ cost-analyzer \
  --namespace kubecost 


# By running this command it will also deploy the Prometheus and Grafana Server. If you dont want to install Prometheus and Grafana while deploying kubecost you can use this command  below mentioned.

helm install kubecost kubecost/cost-analyzer --set  global.prometheus.enabled=false --set global.grafana.enabled=false


# Kubecost has there own UI as Prometheus. To look into it you have to port-forward the pod on 9090 port.
Kubectl port-forward "pod-name" -n "service-name" 9090 -n kubecost


# For adding scrap configs in prometheus which will help to monitor and calculate the pricing of used resources.
Add scrapping in Promtheus custom yaml

additionalScrapeConfigs:
      - job_name: kubecost
        honor_labels: true     
        scrape_interval: 1m
        scrape_timeout: 10s
        metrics_path: /metrics
        scheme: http
        dns_sd_configs:      
        - names:        
          - kubecost-cost-analyzer.kubecost.svc.cluster.local
          type: 'A'        
          port: 9003


After adding you can see as a target in prometheus UI. For scrapping Target should be UP.