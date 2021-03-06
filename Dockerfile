FROM abstractit/puppet-base:0.1.3
MAINTAINER Abstract IT Pty Ltd <dev@abstractit.com.au>
LABEL vendor="Abstract IT Pty Ltd" \
  au.com.abstractit.version="0.1.2" \
  au.com.abstractit.is-beta="true" \
  au.com.abstractit.release-date="2015-10-08"

ENV PUPPETSERVER_VERSION="1.1.1" \
  PUPPETDB_VERSION="2.3.7" \
  PUPPETSERVER_JAVA_RAM="2g" \
  AUTOSIGN_DOMAIN="*.example.com" \
  PUPPETSERVER_USER="puppet"

RUN yum install -y \
  puppetserver-$PUPPETSERVER_VERSION \
  puppetdb-terminus-$PUPPETDB_VERSION \
  && yum -y clean all

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