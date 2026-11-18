FROM node:26-alpine@sha256:6bd9ab43c0ec0190ca7b2d193906cb8b7edf6e7f4afa43ddeccd6452710bffb5 as builder
WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:1.31.9-alpine@sha256:0713660ff64e819a478be0d69ae314e52d21623c93672edd9f381a6e66fd95ff
EXPOSE 3000

COPY --from=builder /app/build /usr/share/nginx/html

