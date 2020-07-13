ARG SSDC_VER_ARG="3.7.1"
FROM streamsets/datacollector:${SSDC_VER_ARG}

ARG SSDC_VER_ARG
ARG DATA_DIR=producer
ENV SDC_SECURITY_MANAGER_ENABLED=false
ENV SSDC_VER=${SSDC_VER_ARG}

#install libs
RUN cd /tmp && \
  curl -O -L "https://archives.streamsets.com/datacollector/${SSDC_VER_ARG}/tarball/streamsets-datacollector-apache-kafka_2_0-lib-${SSDC_VER_ARG}.tgz" && \
  curl -O -L "https://archives.streamsets.com/datacollector/${SSDC_VER_ARG}/tarball/streamsets-datacollector-groovy_2_4-lib-${SSDC_VER_ARG}.tgz" && \
  curl -O -L "https://archives.streamsets.com/datacollector/${SSDC_VER_ARG}/tarball/streamsets-datacollector-mongodb_3-lib-${SSDC_VER_ARG}.tgz" && \
  tar xzf "streamsets-datacollector-apache-kafka_2_0-lib-${SSDC_VER_ARG}.tgz" -C /opt/ && \
  tar xzf "streamsets-datacollector-groovy_2_4-lib-${SSDC_VER_ARG}.tgz" -C /opt/ && \
  tar xzf "streamsets-datacollector-mongodb_3-lib-${SSDC_VER_ARG}.tgz" -C /opt/ && \
  rm *.tgz

ADD --chown=sdc:sdc $DATA_DIR/data /data