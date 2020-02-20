FROM  registry.access.redhat.com/ubi8/nodejs-10

USER root

# Copying in source code
COPY . /opt/app-root/src

RUN chown -R 1001:0 /opt/app-root/src

USER 1001

RUN npm install

CMD ["npm","start"]