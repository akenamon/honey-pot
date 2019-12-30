# ssh-trapper

## it depends on rsyslog-dockerized 

cd ssh-trapper

sudo docker build -t ssh-trapper . 



## if you prefer to use docker-compose

sudo docker run  -dti --name ssh-trapper ssh-trapper  sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \\

sudo chmod +x /usr/local/bin/docker-compose && \\

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose



# How to find the logs ?
## example 

sudo docker inspect -f {{.Mounts}} ssh-trapper_rsyslog_1

cd /var/lib/docker/volumes/059a0f65087f18bf4d0a6a1654392bd417e0f5a0d31c55ab341b258c92bcb709/_data

tail -f auth.log

