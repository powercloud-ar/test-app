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
    GitHub: GitAction (Build & Deploy) 
         -----> Docker Hub: Registry
         -----> ArgoCD: Deployment in  K8s Cluster
    Dynatrace:
    -> Workflow DT
    -> Site Reability Guardian
