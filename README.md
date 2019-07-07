# OPKG Private Server

A docker based opkg server for private use.  This is *not* firewalled and should not be exposed to the outside world without more security. I've been using this for OpenWRT packages, but this could be used for any opkg based system. 

# Usage
Make a `.env` file in the repository directory and set the variables appropriately for where to find the packages and what port to expose on the host system.  See [example.env](example.env) for what that might look like. 

You'll need Docker and Docker Compose installed.  

To build (first run):
```
docker-compose build
```

To run:
```
docker-compose up -d
```

Access the server at http://local-ip-or-hostname:PORT/.

# What is it doing?
See [start-opkg-server.sh](bin/start-opkg-server.sh) to see how the package generation works.  It will rebuild the package list at every startup. 

# More info
I largely followed this set of instructions and then dockerized it. https://jumpnowtek.com/yocto/Managing-a-private-opkg-repository.html

You'll obviously need a set of packages built in order to serve these. 
