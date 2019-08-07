From tomcat:8-alpine

# Maintainer 
MAINTAINER "valaxytech@gmail.com" 
COPY **/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
