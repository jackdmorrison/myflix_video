FROM node:17-alpine AS builder
WORKDIR /myflix_video
COPY myflix_video/package.json ./
RUN npm install 
COPY /myflix_video ./
RUN npm run build

FROM nginx:1.19.0
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /myflix_video/build .
COPY /myflix_video/config/nginx/nginx.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]
EXPOSE 4000