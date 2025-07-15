# Use an official Java runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy everything into the container
COPY . .

# Give Maven wrapper permission to execute
RUN chmod +x mvnw

# Build the project (this creates the jar in /app/target)


# Run the jar file (update the JAR name if it's different)
CMD ["java", "-jar", "target/LIBRARY.jar"]


# Use an OpenJDK image as base


# Dockerfile
#FROM openjdk:17-jdk-slim
#WORKDIR /app
#COPY target/*.jar app.jar
#COPY src/main/webapp/WEB-INF /app/WEB-INF
#EXPOSE 8085
#ENTRYPOINT ["java", "-jar", "app.jar"]

