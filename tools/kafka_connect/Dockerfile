FROM openjdk:21-jdk-slim-buster

ENV KAFKA_TAG=2.13-3.1.0
ENV KAFKA_VERSION=3.1.0
ENV POSTGRES_DRIVER=https://repo1.maven.org/maven2/org/postgresql/postgresql/42.4.3/postgresql-42.4.3.jar
ENV POSTGRES_CONNECTOR=https://repo1.maven.org/maven2/org/apache/camel/kafkaconnector/camel-postgresql-sink-kafka-connector/3.18.2/camel-postgresql-sink-kafka-connector-3.18.2-package.tar.gz

RUN mkdir /integrations /integrations/connectors

# Install curl
RUN apt-get update && apt install -y curl

# Install Kafka Connect
RUN curl -o /integrations/kafka.tgz https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${KAFKA_TAG}.tgz && \
  tar zxvf /integrations/kafka.tgz -C /integrations/ && \
  mv /integrations/kafka_${KAFKA_TAG} /integrations/kafka-src && \
  rm -rf /integrations/kafka.tgz

# Download Postgresql Driver Jar
RUN curl -o /integrations/connectors/postgresql-driver.jar ${POSTGRES_DRIVER}

# Download Postgresql Connector dependencies
RUN curl -o /integrations/connectors/postgresql-connector.tar.gz ${POSTGRES_CONNECTOR}
RUN tar zxvf /integrations/connectors/postgresql-connector.tar.gz -C /integrations/connectors/ && \
   rm -rf /integrations/connectors/postgresql-connector.tar.gz && \
   mv /integrations/connectors/postgresql-driver.jar /integrations/connectors/camel-postgresql-sink-kafka-connector/

COPY ./tools/kafka_connect/integrations/configuration /integrations/configuration
COPY ./tools/kafka_connect/scripts/start_connector.sh /integrations/scripts/start_connector.sh

CMD ["bash", "/integrations/scripts/start_connector.sh"]
