FROM maven:3.9.3 AS build
WORKDIR /app
COPY pom.xml /app
RUN mvn dependency:resolve
COPY . /app
RUN mvn clean package -DskipTests

FROM openjdk:17
COPY --from=build /app/target/*.jar app.jar
EXPOSE $PORT
CMD ["java", "-jar", "app.jar"]
