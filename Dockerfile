# Use an official Java runtime as a parent image
#FROM openjdk:17-jdk-slim

# Set the working directory inside the container
#WORKDIR /app

# Copy everything into the container
#COPY . .

# Give Maven wrapper permission to execute
#RUN chmod +x mvnw

# Build the project (this creates the jar in /app/target)


# Run the jar file (update the JAR name if it's different)
#CMD ["java", "-jar", "target/LIBRARY.jar"]


# Use an OpenJDK image as base
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the jar file (built later) into the container
COPY target/*.jar app.jar

# Expose the Spring Boot port
EXPOSE 8085

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
