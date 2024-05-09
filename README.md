# Test NodeJS App
public
- Aplicacion TEST: Pipeline DevOps + Observabilidad OpenTelemetry

        Services: 
            - Backend: NodeJS
            - Database: MongoDB
---
## DevOps Pipeline
    GitHub: 
    Commit -> Pull Request -> Merge -> GitAction (Build & Deploy) 
         -----> Harbor: Registry -> Scan Vulnerabilities
         -----> ArgoCD: Deployment in  K8s Cluster
    Dynatrace:
    -> Workflow DT -> Create event, synthetic, slo
                   -> Run Sinthetic
    -> Site Reability Guardian
---
## Observabilidad Dynatrace

### Metrics
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
### Traces
    Opentelemetry
    
### Logs
Logs en Nodejs

    > npm install winston

    const winston = require('winston');

    const logger = winston.createLogger({
    format: winston.format.simple(),
    transports: [
        new winston.transports.Console(),
    ],
    });

    logger.info('Hello, Fluent Bit!');
