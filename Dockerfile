ARG CATALOG_API_VERSION="0.1.0-alpha.10"
ARG NGINX_VERSION="1.19.2"

# Use multi-stage Dockerfile to fetch desired catalog-api version
FROM debian:buster AS catalog-api
ARG CATALOG_API_VERSION
LABEL stage=builder
RUN apt-get update && apt-get install -y curl git jq
RUN curl -L "https://github.com/sensu/catalog-api/releases/download/${CATALOG_API_VERSION}/catalog-api_${CATALOG_API_VERSION}_linux_amd64.tar.gz" -o /tmp/catalog-api_${CATALOG_API_VERSION}_linux_amd64.tar.gz
RUN tar -xzf /tmp/catalog-api_${CATALOG_API_VERSION}_linux_amd64.tar.gz catalog-api && mv catalog-api /usr/local/bin/
RUN command -v catalog-api
RUN command -v jq

# Build the catalog image
FROM nginx:${NGINX_VERSION} AS catalog
COPY --from=catalog-api /usr/local/bin/catalog-api /usr/local/bin/
COPY --from=catalog-api /usr/bin/jq /usr/local/bin/
COPY ./docker/entrypoint.sh /docker-entrypoint.d/0-catalog-entrypoint.sh
COPY ./docker/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /build

# docker build -t sensu-catalog:latest .
# docker run --rm -d --name sensu-catalog -v $PWD:/catalog -p 8888:80 sensu-catalog:latest
# docker stop sensu-catalog
