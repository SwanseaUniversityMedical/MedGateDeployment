FROM swanseauniversitymedical/gcp

COPY m2-cache /config/m2-cache

COPY m2-settings.xml /config/

ENV HTTP_PROXY=http://192.168.69.5
ENV HTTPS_PROXY=http://192.168.69.5

ENTRYPOINT ["/usr/bin/java", "-jar", "/opt/gcp/gcp-cli.jar", "-DM2_SETTINGS_XML=/config/m2-settings.xml", "-C", "/config/m2-cache", "-p", "uk.ac.gate.gcp:simple-json:0.1-SNAPSHOT"]

CMD ["-t", "6", "-m", "4G"]
