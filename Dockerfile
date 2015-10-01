FROM abstractit/puppet-base:0.1.0
MAINTAINER Abstract IT Pty Ltd <dev@abstractit.com.au>
LABEL vendor="Abstract IT Pty Ltd"
LABEL au.com.abstractit.version="dev"
LABEL au.com.abstractit.is-beta="true"
LABEL au.com.abstractit.release-date="2015-09-26"

ENV PUPPETSERVER_JAVA_RAM="2g"
ENV AUTOSIGN_DOMAIN="*.example.com"

RUN yum install -y puppet hiera facter puppetserver puppetdb-terminus

RUN yum -y clean all

# install hiera-eyaml
RUN puppetserver gem install hiera-eyaml

# add config/startup script
ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8140
EXPOSE 8139

# add volumes for non static
VOLUME ["/etc/puppet/environments"]
VOLUME ["/var/lib/puppet"]

CMD ["/run.sh"]