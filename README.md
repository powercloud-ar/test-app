# Doc

https://docs.dynatrace.com/docs/shortlink/pipeline-observability

https://docs.dynatrace.com/docs/deliver/quality-gates

https://docs.dynatrace.com/docs/shortlink/srg-landing

https://docs.dynatrace.com/docs/shortlink/deployment-observability-use-case-argocd

---

# Test NodeJS App
---

## Pipeline DevOps + Observabilidad OpenTelemetry
  
        Services: 
            - Backend: NodeJS
            - Database: MongoDB
---
## DevOps Pipeline
    GitHub: 
    Commit -> Pull Request -> Merge -> GitAction (Build & Deploy) 
         -----> Docker Hub: Registry
         -----> ArgoCD: Deployment in  K8s Cluster
    Dynatrace:
    -> Workflow DT
    -> Site Reability Guardian
---
## Observabilidad Dynatrace

### Metrics

#### Annotating the ArgoCD Metrics Services

        Based on the ArgoCD Metrics documentation there are 3 Services exposing Prometheus metrics:
        Type / Endpoint
        Application Controller Metrics:	argocd-metrics:8082/metrics
        API Server Metrics Metrics:	argocd-server-metrics:8083/metrics
        Repo Server Metrics: argocd-repo-server:8084/metrics

        When deploying ArgoCD you will automatically have those 3 services and all we need to do is add two lines to each service to tell Dynatrace to start scraping those metrics:

        Ejemplo para argocd-repo-server:

        apiVersion: v1
        kind: Service
        metadata:
        annotations:
            metrics.dynatrace.com/port: "8084"
            metrics.dynatrace.com/scrape: "true"

        labels:
            app.kubernetes.io/component: repo-server
            app.kubernetes.io/name: argocd-repo-server
            app.kubernetes.io/part-of: argocd
        name: argocd-repo-server
        namespace: argocd

#### NodeJS Service:

        annotations:
                instrumentation.opentelemetry.io/inject-nodejs: 'true'
                metrics.dynatrace.com/scrape: 'true'
                metrics.dynatrace.com/path: /metrics
                metrics.dynatrace.com/port: '3000'
                metrics.dynatrace.com/secure: 'false'
                metrics.dynatrace.com/filter: |
                  {
                    "mode": "include",
                    "names": [
                        "mitienda_nodejs_active_handles"
                        ]
                  }
