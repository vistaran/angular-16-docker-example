# Algorithm: 
# 
# Stage 1: 
# 1. Install node
# 2. Create and set working directory inside container
# 3. Copy angular project files from current folder to the directory inside container
# 4. Install angular cli
# 5. Install modules
# 6. Create angular build
# 
# Stage 2:
# 1. Install nginx
# 2. Copy build files from stage 1 to Nginx default folder to server the files as static website
# 3. Expose port 80 outside container and visit localhost


# Stage 1:  Create image based on the official Node 16 image from dockerhub
FROM node:18.16.1-alpine AS builder

# Change directory so that our commands run inside this new directory
WORKDIR /dist/src/app
COPY . /dist/src/app
RUN npm cache clean --force
RUN npm install @angular/cli@16.1.4 -g
RUN npm install
RUN ng build

# Stage 2: Install Nginx, Copy files and Expose Port
FROM nginx:latest AS ngi

# Copying compiled code and nginx config to different folder
# NOTE: This path may change according to your project's output folder 
COPY --from=builder /dist/src/app/dist/angular-sample /usr/share/nginx/html

# Expose related ports.
EXPOSE 80
