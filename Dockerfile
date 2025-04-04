# Use the latest NGINX image as the base
FROM nginx:latest

# Copy all static website files (HTML, CSS, JS, images) to the NGINX web root
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY app.js /usr/share/nginx/html/
COPY img/ /usr/share/nginx/html/img/

# Expose port 80 for web traffic
EXPOSE 80

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
