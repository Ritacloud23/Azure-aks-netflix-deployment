FROM maven:3.9-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY application.properties /app/src/main/resources/application.properties
COPY ./src /app/src
COPY ./pom.xml /app
RUN mvn -f /app/pom.xml clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]