FROM node:14-alpine as builder

WORKDIR /usr/src/app

COPY package.json .
COPY yarn.lock ./

RUN yarn install

COPY ./ ./
RUN yarn build


FROM nginx:latest

RUN rm -rf /etc/nginx/conf.d
RUN rm -rf /usr/share/nginx/html/*

COPY nginx /etc/nginx
COPY --from=builder /usr/src/app/.next /usr/share/nginx/html

EXPOSE 80

