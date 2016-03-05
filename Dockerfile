FROM java:8-jdk

EXPOSE 4567

ADD http://apache.mirror.gtcomm.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz /apache-maven-3.3.9-bin.tar.gz
RUN tar -xzf /apache-maven-3.3.9-bin.tar.gz
ENV PATH ${PATH}:/apache-maven-3.3.9/bin

RUN mkdir /src
WORKDIR /src

COPY pom.xml .
RUN mvn dependency:resolve verify

COPY src ./src
RUN mvn package

COPY ./docker-entrypoint.sh .

ENTRYPOINT ["./docker-entrypoint.sh"]
