FROM nginx:stable-alpine

WORKDIR /app

COPY nginx.conf /etc/nginx/nginx.conf
COPY dist /app/dist

CMD ["nginx", "-g", "daemon off;"]
