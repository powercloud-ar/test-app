FROM public.ecr.aws/docker/library/node:18-alpine3.18
#COPY --from=https://dqk02008.live.dynatrace.com/linux/oneagent-codemodules:nodejs / /
#ENV LD_PRELOAD /opt/dynatrace/oneagent/agent/lib64/liboneagentproc.so

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# Install app dependencies
COPY src/package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY src/ /usr/src/app

#ENV ROOKOUT_TOKEN ebb07cf7e957d775764cc76947abc2fc837bd68938351fbe9a4c259464504e38

COPY .git /.git

EXPOSE 3000

# Run app
CMD [ "npm", "start" ]
