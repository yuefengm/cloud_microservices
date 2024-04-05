FROM sonarqube

# Disable Elasticsearch bootstrap checks
ENV SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true

# Switch to root user to make changes to SonarQube configuration
USER root

# Append configuration to disable forced user authentication
# and any other necessary configurations
RUN echo "sonar.forceAuthentication=false" >> $SONARQUBE_HOME/conf/sonar.properties

# Switch back to the sonarqube user for security
USER sonarqube

# Expose the default SonarQube port
EXPOSE 9000

# Use the default entrypoint as defined in the base SonarQube image
ENTRYPOINT ["/opt/sonarqube/docker/entrypoint.sh"]
