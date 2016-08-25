FROM jenkins:2.7.2
RUN /usr/local/bin/install-plugins.sh managed-scripts
RUN /usr/local/bin/install-plugins.sh config-file-provider
RUN /usr/local/bin/install-plugins.sh performance
USER root
COPY jmeter.pem /var/lib/jenkins/jmeter.pem
ENV AWS_DEFAULT_REGION=us-east-1
ENV AWS_ACCESS_KEY_ID=AKIAJBQGRBBFC2DAFY2A
ENV AWS_SECRET_ACCESS_KEY=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
COPY verify.sh /tmp/verify.sh
COPY jmeter.properties /tmp/jmeter.properties
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py && \
	pip install awscli && \
	apt-get update && \
	apt-get install bc && \
	chown jenkins /var/lib/jenkins/jmeter.pem && \
	chmod 400 /var/lib/jenkins/jmeter.pem
USER jenkins