# Basic Image:
FROM nginx:latest
# Copying the appropriate files into the image
COPY index.html /usr/share/nginx/html/ 
COPY Cat_mem.jpg /usr/share/nginx/html/
# Open a port to interact with a container
EXPOSE 80