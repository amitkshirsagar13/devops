# Switch to the scratch image
FROM nginx:stable-alpine

EXPOSE 80
RUN rm -v /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/

RUN rm -rf /usr/share/nginx/html
ADD web /usr/share/nginx/html/
ADD web /var/www/html/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY static/* /usr/share/nginx/html
CMD service nginx start
