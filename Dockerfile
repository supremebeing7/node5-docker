FROM debian:jessie-slim

RUN set -ex \
  \
  && buildDeps=' \
    curl \
  ' \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_5.x | bash \
  && apt-get update \
  && apt-get install -y --no-install-recommends nodejs \
  && rm -rf /var/lib/apt/lists/*

# Remove buidependencies
RUN apt-get purge -y --auto-remove $buildDeps

CMD ["bash"]
