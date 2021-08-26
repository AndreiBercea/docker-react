FROM node:10-alpine as builder
ENV HTTP_PROXY="http://10.31.255.65:8080"
ENV HTTPS_PROXY="http://10.31.255.65:8080"
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
