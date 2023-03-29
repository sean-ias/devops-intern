"sean2003/tomcat:app" image's Dockerfile is very simple:
FROM tomcat
COPY ./sample.war /usr/local/tomcat/webapps/

Here sample.war was uploaded via wget <link> command.

ingress controller was required to help tomcat.
