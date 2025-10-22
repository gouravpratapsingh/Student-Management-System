# Use official Tomcat image with Java 17
FROM tomcat:10.1-jdk17-temurin

# Set working directory inside the container
WORKDIR /usr/local/tomcat

# Remove default webapps to avoid conflicts
RUN rm -rf webapps/*

# Copy your WAR file into Tomcat's webapps directory
COPY target/Student-Mgmt.war webapps/ROOT.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]