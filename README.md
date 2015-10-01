# abstractit/puppetserver

Setup the new PuppetLabs Puppetserver as a Docker container.
Support is pretty basic at the moment but that will grow as I add more features.

# Security Note

The container sets up autosigning using the AUTOSIGN_DOMAIN env var.
The default is *.example.com so please change that as needed.

# Running
```
docker run -d -e PUPPETSERVER_JAVA_RAM="2g" -e AUTOSIGN_DOMAIN="*.example.com" -v $PUPPET_ENVIRONMENT_DIRECTORY:/etc/puppet/environments -v $PUPPET_VAR_DIR:/var/lib/puppet -p 8140:8140 -p 8139:8139 abstractit/puppetserver
```

# Notes

This repo is automatically built from GitHub repo [abstractitptyltd/docker-puppetserver](https://github.com/abstractitptyltd/docker-puppetserver) using CircleCI.

# TODO
Add version variables.
Add support for connecting to PuppetDB.
