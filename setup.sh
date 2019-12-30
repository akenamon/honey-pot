#!/bin/bash

## First we must install some dependencies
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://get.docker.com -o get-docker.sh | sh get-docker.sh

curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose && \
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


## Time to use docker compose to start all containers
docker-compose up -d 


## use docker to get rsyslog data 
echo '
#!/bin/bash
 check_security_state()
{ 
        _trigger=$(docker logs rsyslog   2> /dev/null | egrep -m1 -o 'DANGER' )
        if [ ! -z $_trigger ] ;then 
                if [ "$_trigger" == "DANGER" ] ; then
                        echo "DANGER!! Somebody want to hack us!" | /usr/bin/wall 
                fi
        fi

}

check_security_state 
' > /usr/local/bin/ssh-trapper-check.sh && \
chmod +x /usr/local/bin/ssh-trapper-check.sh

## We are going to monitor login activity with  cron 
echo 'SHELL=/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin
*/10 * * * * root /bin/bash -c /usr/local/bin/ssh-trapper-check.sh
#' > /etc/cron.d/ssh-trapper-check

clear

echo "ssh trap was actived!"

