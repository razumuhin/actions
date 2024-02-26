FROM nginx:latest
LABEL maintainer="Ersin KAYA @razumuhin" version="1.0" name="hello-docker-html"
ENV KULLANICI="Dunyali"
RUN apt-get update && apt-get install curl -y
WORKDIR /usr/share/nginx/html
COPY Hello_docker.html /usr/share/nginx/html
HEALTHCHECK --interval=30s --timeout=10s --tart-period=5s --retries=3 CMD curl -f http://localhost/ || exit 1
CMD sed -e s/Kullanici/"$KULLANICI"/ Hello_docker.html > index1.html && sed -e s/Hostname/"$HOSTNAME"/ index1.html > index.html ; rm index1.html Hello_docker.html; nginx -g 'daemon off;'