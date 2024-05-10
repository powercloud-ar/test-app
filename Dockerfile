FROM public.ecr.aws/docker/library/node:21-alpine3.18
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# Install app dependencies
COPY src/package.json /usr/src/app/
RUN npm install
RUN npm install --save rookout


# Bundle app source
COPY src/ /usr/src/app

ENV NODE_OPTIONS "-r rookout/start"
ENV ROOKOUT_TOKEN ebb07cf7e957d775764cc76947abc2fc837bd68938351fbe9a4c259464504e38
ENV ROOKOUT_LABELS env:dev

COPY .git /.git

EXPOSE 3000

# Run app
CMD [ "npm", "start" ]