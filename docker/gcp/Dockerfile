FROM gatenlp/gcp:3.0-alpha1

COPY m2-cache /config/m2-cache

COPY m2-settings.xml /config/

ENTRYPOINT ["/usr/bin/java", "-jar", "/opt/gcp/gcp-cli.jar", "-DM2_SETTINGS_XML=/config/m2-settings.xml", "-C", "/config/m2-cache", "-p", "uk.ac.gate.gcp:simple-json:0.1-SNAPSHOT"]

CMD ["-t", "6", "-m", "4G"]
