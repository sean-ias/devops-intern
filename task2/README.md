1) Initially to host our app in Tomcat, I needed Docker Engine. "sean2003/tomcat:app" image's Dockerfile is very simple:
FROM tomcat
COPY ./sample.war /usr/local/tomcat/webapps/

*Here sample.war was uploaded via wget <link> command.

2) ingress controller was required to help tomcat.
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.7.0/deploy/static/provider/cloud/deploy.yaml
Another option was to install ingress controller via Helm :)
