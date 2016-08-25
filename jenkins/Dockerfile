FROM jenkins:2.7.2
RUN /usr/local/bin/install-plugins.sh managed-scripts
RUN /usr/local/bin/install-plugins.sh config-file-provider
RUN /usr/local/bin/install-plugins.sh performance
USER root
COPY jmeter.pem /var/lib/jenkins/jmeter.pem
COPY credentials /var/lib/jenkins/credentials
COPY config /var/lib/jenkins/config
COPY verify.sh /var/lib/jenkins/verify.sh
COPY jmeter.properties /var/lib/jenkins/jmeter.properties
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py && \
	pip install awscli && \
	mkdir /var/jenkins_home/.aws && \
	apt-get update && \
	apt-get install bc && \
	mv /var/lib/jenkins/credentials /var/jenkins_home/.aws && \
	mv /var/lib/jenkins/config /var/jenkins_home/.aws && \
	mv /var/lib/jenkins/verify.sh /tmp && \
	mv /var/lib/jenkins/jmeter.properties /tmp && \
	chown jenkins /var/lib/jenkins/jmeter.pem && \
	chmod 400 /var/lib/jenkins/jmeter.pem
USER jenkins
