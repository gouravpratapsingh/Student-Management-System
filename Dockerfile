# Use Tomcat with Java 17
FROM tomcat:10.1-jdk17-temurin

# Set working directory
WORKDIR /usr/local/tomcat

# Remove default webapps (optional but cleaner)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file from Maven target to Tomcat
COPY target/Student-Mgmt.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]