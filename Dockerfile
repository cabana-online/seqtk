FROM cabanaonline/dev:1.0

ARG USER=cabana
ENV HOME /home/$USER

# Downloads compiled libraries.
RUN set -xe; \
    \
    git clone --branch v1.3 https://github.com/lh3/seqtk.git tools/seqtk && \
    cd tools/seqtk && make;

USER root

# Downloads compiled libraries.
RUN set -xe; \
    \
    apk del \
        build-base \
        zlib-dev \
        make;

USER cabana

# Entrypoint to keep the container running.
ENTRYPOINT ["tail", "-f", "/dev/null"]