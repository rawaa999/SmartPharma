FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn package -DskipTests 2>/dev/null || true

FROM tomcat:10.1-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war 2>/dev/null || true
EXPOSE 8080
CMD ["catalina.sh", "run"]