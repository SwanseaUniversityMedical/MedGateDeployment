FROM docker.elastic.co/beats/metricbeat:6.1.2

COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml

USER root
RUN chmod go-w /usr/share/metricbeat/metricbeat.yml

RUN mv /usr/share/metricbeat/modules.d/docker.yml.disabled /usr/share/metricbeat/modules.d/docker.yml
RUN mv /usr/share/metricbeat/modules.d/postgresql.yml.disabled /usr/share/metricbeat/modules.d/postgresql.yml
