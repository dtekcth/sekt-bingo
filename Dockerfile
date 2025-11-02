FROM node:25-alpine as builder
WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:1.29.3-alpine
EXPOSE 3000

COPY --from=builder /app/build /usr/share/nginx/html

