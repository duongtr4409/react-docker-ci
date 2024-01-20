FROM node:21-bookworm-slim as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build

FROM duowngtora/kubernetes:nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY ./certs /certs
COPY --from=build app/build /usr/share/nginx/html
