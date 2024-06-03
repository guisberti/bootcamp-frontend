# Build do frontend
FROM node:20 as builderfrontend
WORKDIR /usr/src/app
COPY package*.json .
RUN npm install
COPY src/ ./src/
COPY public/ ./public/
RUN npm run build


#build do container docker
FROM nginx
COPY --from=builderfrontend /usr/src/app/build/ /usr/share/nginx/html
EXPOSE 80