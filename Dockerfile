FROM node:25-alpine as builder
WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:1.31.8-alpine@sha256:1ef7ca94d7879df82421428ce13bd1eaa412404953859cf7a5b6512c25e67a60
EXPOSE 3000

COPY --from=builder /app/build /usr/share/nginx/html

