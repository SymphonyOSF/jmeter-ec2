FROM jenkins:2.7.2
RUN /usr/local/bin/install-plugins.sh managed-scripts
RUN /usr/local/bin/install-plugins.sh config-file-provider
RUN /usr/local/bin/install-plugins.sh performance
RUN /usr/local/bin/install-plugins.sh postbuildscript
RUN /usr/local/bin/install-plugins.sh rebuild
RUN /usr/local/bin/install-plugins.sh git
USER root
COPY crypto.zip /var/lib/sym-crypto/crypto.zip
RUN cd /var/lib/sym-crypto && unzip crypto.zip
ENV AWS_DEFAULT_REGION=us-east-1
COPY verify.sh /tmp/verify.sh
COPY jmeter.properties /tmp/jmeter.properties
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py && \
	pip install awscli && \
	apt-get update && \
	apt-get install bc
USER jenkins
