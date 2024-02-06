#Build do projeto em React
#Obs.: alterar o arquivo de configuração(nginx.conf) das apis para o endereço correto,
# o arquivo está na pasta config
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

#Geração da imagem do Nginx para rodar o projeto
FROM nginx:stable-alpine3.17-slim
COPY ./config/ngnix.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/build .
ENTRYPOINT ["nginx", "-g", "daemon off;"]