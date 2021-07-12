FROM sonarqube:lts-community

ENV SUMMARY="SonarQube for OpenShift" \
    DESCRIPTION="This image creates the SonarQube image for use at OpenShift"

LABEL summary="$SUMMARY" \
  description="$DESCRIPTION" \
  io.k8s.description="$DESCRIPTION" \
  io.k8s.display-name="sonarqube" \
  io.openshift.expose-services="9000:http" \
  io.openshift.tags="sonarqube" \
  release="$SONAR_VERSION"

WORKDIR $SONARQUBE_HOME

RUN chmod -R g=u "$SONARQUBE_HOME" \
  && chgrp -R 0 "$SONARQUBE_HOME" \
  && chmod -R g+rwX "$SONARQUBE_HOME/extensions" \
  && chmod 775 "$SONARQUBE_HOME/bin/run.sh"

USER 1001
