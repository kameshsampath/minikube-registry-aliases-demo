FROM docker.io/nodeshift/ubi8-s2i-web-app as builder
LABEL "io.openshift.s2i.build.image"="docker.io/nodeshift/ubi8-s2i-web-app" \
      "io.openshift.s2i.scripts-url"="image:///usr/libexec/s2i"

ENV YARN_ENABLED=true

USER root
# Copying in source code
COPY . /tmp/src
# Change file ownership to the assemble user. Builder image must support chown command.
RUN chown -R 1001:0 /tmp/src
USER 1001
# Assemble script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
RUN /usr/libexec/s2i/assemble
# Run script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
CMD /usr/libexec/s2i/run

FROM nginx
COPY --from=builder /opt/app-root/output /usr/share/nginx/html
