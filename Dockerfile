# Stage 1 - Build app
FROM node:20-alpine as build-stage

WORKDIR /usr 

COPY ./ ./

RUN npm install -g pnpm
RUN pnpm add -D typescript
RUN pnpm install -r
RUN pnpm turbo build

# Stage 2 - Deploy app on nginx
FROM nginx:alpine
WORKDIR /usr/share/nginx/html 

RUN rm -rf ./*

COPY --from=build-stage /usr/apps/web/dist . 

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
