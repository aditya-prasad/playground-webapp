################################################################
#  BUILD
################################################################
FROM node:13.13-alpine3.10 AS builder

WORKDIR /webapp

# install dependencies
COPY package*.json ./
RUN npm install

# build code
COPY . .
RUN npm run build

################################################################
#  MAIN
################################################################
FROM nginx:1.17.10-alpine

# copy built webapp
COPY --from=builder /webapp/build/ /webapp
RUN chmod -R 755 /webapp/*

# copy nginnx connfig
COPY nginx/nginx.conf /etc/nginx/

EXPOSE 80