FROM maven:3-openjdk-17-slim AS dependency

WORKDIR /var/eureka

COPY . .

RUN mvn dependency:go-offline -B

RUN mvn clean package -DskipTests

FROM openjdk:17-slim

ENV LANG en_US.UTF_8

ARG USER=eureka

ARG USER_UID=1001

ARG USER_GID=$USER_UID

RUN groupadd --gid "$USER_GID" "$USER" && useradd --uid "$USER_UID" --gid "$USER_GID" -m "$USER"

WORKDIR /home/$USER

COPY --from=dependency /var/eureka/target/*.jar app.jar

VOLUME data

USER $USER

ENTRYPOINT java -Djava.security.egd=file:/dev/urandom -jar app.jar
