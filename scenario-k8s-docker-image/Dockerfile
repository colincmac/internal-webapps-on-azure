# Must be built from root repository

FROM node:16-alpine AS builder
WORKDIR /app
COPY ./react-app/package.json ./react-app/package-lock.json ./
RUN npm install 

# Copies everything over to Docker environment
COPY ./react-app .
ENV REACT_APP_GREETING="I'm running from a dedicated Dockerfile."
RUN npm run build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
# Remove default nginx static resources
RUN rm -rf ./*
COPY ./scenario-k8s-docker-image/nginx.conf /etc/nginx/conf.d/default.conf
# Copies static resources from builder stage
COPY --from=builder /app/build .
# Containers run nginx with global directives and daemon off
CMD ["nginx", "-g", "daemon off;"]
