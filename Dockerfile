FROM node:26-alpine@sha256:c6ad9e9c1d80f6eb607c26b4b0a132ff7a2344fad1c78ea3baa2a7d4c8de6d94 as builder
WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:1.31.8-alpine@sha256:785835ea65db4bba6f021acc0f3be91b0fef76a53fe41f8588c6698d2aed0606
EXPOSE 3000

COPY --from=builder /app/build /usr/share/nginx/html

