FROM node:17-alpine
WORKDIR /myflix_video
COPY myflix_video/package.json ./
RUN npm install 
RUN npm install -g nodemon
COPY /myflix_video ./
RUN chmod +x ./node_modules/.bin/nodemon
CMD ["npm", "run", "dev"]

# FROM nginx:1.19.0
# WORKDIR /usr/share/nginx/html
# RUN rm -rf ./*
# COPY --from=builder /myflix_video/ .
# COPY /myflix_video/config/nginx/nginx.conf /etc/nginx/conf.d/default.conf
# ENTRYPOINT ["nginx", "-g", "daemon off;"]
EXPOSE 4000