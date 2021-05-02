FROM gradle:latest
COPY . /home/gradle/src
WORKDIR /home/gradle/src
RUN chmod +x .gradlew && \
     ./gradlew clean test --no-daemon && \
     ./gradlew build
FROM jenkins/jenkins:lts
USER root
RUN apt-get update
RUN curl -sSL https://get.docker.com/ | sh

EXPOSE 8081
