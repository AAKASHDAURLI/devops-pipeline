# Use Nginx base image
FROM nginx:latest

# Copy the app content to Nginx default public folder
COPY app /usr/share/nginx/html

# Expose default Nginx port
EXPOSE 80
