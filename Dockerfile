FROM jhuguetn/cat12:r1904

MAINTAINER Jordi Huguet <jhuguet@barcelonabeta.org>

LABEL description="CAT12 denoise docker image"
LABEL maintainer="jhuguet@barcelonabeta.org"
#LABEL git_version=$git_version

# copy scripts and run.sh entrypoint
COPY scripts /root/scripts
COPY run.sh /root/bin/run.sh
RUN chmod +x /root/bin/run.sh
ENV PATH="${PATH}:/root/bin"

ENTRYPOINT ["run.sh"]
