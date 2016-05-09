FROM jboss/wildfly:latest

ADD target/couchbase-javaee.war /opt/jboss/wildfly/standalone/deployments/

EXPOSE 9990