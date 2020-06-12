FROM java:8-jdk

EXPOSE 4567

ENV MAVEN_VERSION 3.6.3
ADD https://muug.ca/mirror/apache-dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz /apache-maven-${MAVEN_VERSION}-bin.tar.gz
RUN tar -xzf /apache-maven-${MAVEN_VERSION}-bin.tar.gz
ENV PATH ${PATH}:/apache-maven-${MAVEN_VERSION}/bin

RUN mkdir /src
WORKDIR /src

COPY pom.xml .
RUN mvn dependency:resolve verify

COPY src ./src
RUN mvn package

COPY ./wait-for-it.sh .
COPY ./docker-entrypoint.sh .

ENTRYPOINT ["./wait-for-it.sh", "database:5432", "--", "./docker-entrypoint.sh"]
