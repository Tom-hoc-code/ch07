FROM tomcat:8.5-jdk8
WORKDIR /usr/local/tomcat
RUN rm -rf webapps/*
COPY target/ch07cart-1.0.0.war webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]