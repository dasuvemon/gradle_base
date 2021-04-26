FROM gradle:latest
COPY . /home/gradle/src
WORKDIR /home/gradle/src
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz 
RUN chmod +x .gradlew && \
    ./gradlew clean test --no-daemon && \
    ./gradlew build


 EXPOSE 8081
