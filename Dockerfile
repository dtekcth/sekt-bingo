FROM node:12-alpine
WORKDIR /usr/app
COPY package.json package-lock.json ./
RUN npm install --quiet
COPY . ./
EXPOSE 3000
ENTRYPOINT npm start
