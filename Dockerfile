FROM tomcat:10.1-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY SmartPharma.war /usr/local/tomcat/webapps/ROOT.war

WORKDIR /usr/local/tomcat/webapps

RUN mkdir ROOT && cd ROOT && jar -xf ../ROOT.war && cd .. && rm ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]