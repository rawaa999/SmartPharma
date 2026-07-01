FROM tomcat:10.1-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY SmartPharma.war /usr/local/tomcat/webapps/ROOT.war

RUN cd /usr/local/tomcat/webapps && \
    jar -xf ROOT.war && \
    rm ROOT.war && \
    mv SmartPharma ROOT 2>/dev/null || true

EXPOSE 8080

CMD ["catalina.sh", "run"]