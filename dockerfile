# Use the official Apache HTTP server image as the base image
FROM httpd:latest

# Copy the HTML files to the appropriate directory in the container
COPY ./websites/ /usr/local/apache2/htdocs/
