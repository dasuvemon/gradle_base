FROM gradle:latest
COPY . /home/gradle/src
WORKDIR /home/gradle/src
RUN chmod +x .gradlew && \
    ./gradlew clean test --no-daemon && \
    ./gradlew build
 
 USER root

# Install Docker from official repo
RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && \
    apt-get install -qqy docker-ce && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins $JENKINS_HOME/

USER jenkins

 EXPOSE 8081
