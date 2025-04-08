# Dockerfile
FROM openjdk:17-jdk-alpine
EXPOSE 8089
VOLUME /tmp
COPY target/kaddem-0.0.1-SNAPSHOT.jar kaddem.jar

ENTRYPOINT ["java", "-jar", "kaddem.jar"]
