# Use the official Jenkins LTS image as a base
FROM jenkins/jenkins:lts

# Install necessary plugins including Configuration as Code and others
RUN jenkins-plugin-cli --plugins "sonar configuration-as-code github-branch-source"

# Copy the JCasC YAML configuration into the Jenkins home directory
COPY jenkins-sonar.yaml $JENKINS_HOME/jenkins-sonar.yaml

# Set the Jenkins Configuration as Code environment variable
ENV CASC_JENKINS_CONFIG=$JENKINS_HOME/jenkins-sonar.yaml

# Set JVM options to disable CSRF protection and skip the initial setup wizard
ENV JAVA_OPTS "-Dhudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION=true -Djenkins.install.runSetupWizard=false"

# Switch to root to install packages
USER root

# Install necessary system packages
RUN apt-get update && apt-get install -y unzip && apt-get clean

# Install SonarQube Scanner
RUN curl -L -o /tmp/sonarscanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip && \
    unzip /tmp/sonarscanner.zip -d /opt/ && \
    mv /opt/sonar-scanner-5.0.1.3006-linux /opt/sonar-scanner && \
    rm /tmp/sonarscanner.zip

# Copy the job configuration directory into Jenkins
COPY test/ $JENKINS_HOME/jobs/test/

# Ensure Jenkins user owns the Jenkins home
RUN chown -R jenkins:jenkins $JENKINS_HOME

# Switch back to Jenkins user
USER jenkins

# Environment variables for SonarQube host
ENV SONAR_HOST_IP="34.48.37.185"
ENV SONAR_HOST_PORT="9000"

# Expose Jenkins web interface and agent ports
EXPOSE 8080
EXPOSE 50000
