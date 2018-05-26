FROM node:9-alpine as build

WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build


FROM nginx:alpine as server

COPY default.conf /etc/nginx/conf.d/
COPY --from=build /app/dist/ /usr/share/nginx/html/