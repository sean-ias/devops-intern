1) Initially to host our app in Tomcat, I needed Docker Engine.
2) "sean2003/tomcat:app" image's Dockerfile is very simple: <br>
FROM tomcat <br>
COPY ./sample.war /usr/local/tomcat/webapps/ <br>

*Here sample.war was uploaded via wget <link> command.

3) ingress controller was required to help tomcat. <br>
*kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.7.0/deploy/static/provider/cloud/deploy.yaml <br>
Another option was to install ingress controller via Helm :)
