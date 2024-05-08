# Test NodeJS App

- Aplicacion TEST: Pipeline DevOps + Observabilidad OpenTelemetry

        Services: 
            - Backend: NodeJS
            - Database: MongoDB
---
## DevOps Pipeline
    GitHub: 
    Commit -> Pull Request -> Merge -> GitAction (Build & Deploy) 
         -----> Harbor: Registry
         -----> ArgoCD: Deployment in  K8s Cluster
    Dynatrace:
    -> Workflow DT -> Create event, sysntetic, slo
    -> Site Reability Guardian
---
## Observabilidad

### Metrics
### Traces
### Logs
    > npm install winston

    const winston = require('winston');

    const logger = winston.createLogger({
    format: winston.format.simple(),
    transports: [
        new winston.transports.Console(),
    ],
    });

    logger.info('Hello, Fluent Bit!');
