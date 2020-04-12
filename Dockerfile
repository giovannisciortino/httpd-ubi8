FROM registry.access.redhat.com/ubi8/ubi
USER root
LABEL maintainer="Giovanni Sciortino"
# Update image
RUN yum update --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos -y && rm -rf /var/cache/yum
RUN yum install --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos httpd -y && rm -rf /var/cache/yum
# setup the volume where the website will be hosted
VOLUME [ "/var/www/html" ]

# set the working directory
WORKDIR /var/www/html
# Expose a port
EXPOSE 80
# Start the service
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
