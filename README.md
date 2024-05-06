# Test NodeJS App
Aplicación simple de ejemplo .

## DevOps
### Pipeline
 Commit (Github) -> GitAction (Build & Deploy) 
  
  --> Harbor 
  
  --> Argo
 
 -> Workflow DT -> Create event, sysntetic, slo
 
 -> Site Reability Guardian

## Observabilidad
### Logs
### Metrics
### Traces

express --view=jade ejemplo

    npm install
    npm install jsonwebtoken
    npm install mongoose
    npm install bcrypt

DEBUG=ejemplo:* npm start


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
