FROM wordpress:latest

# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /etc/httpd/conf
RUN chgrp -R root /etc/httpd/conf

# users are not allowed to listen on priviliged ports
RUN sed -i.bak 's/listen\(.*\)80;/listen 8080;/' /etc/httpd/conf/httpd.conf
EXPOSE 8080
