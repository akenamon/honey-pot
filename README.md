# ssh-trapper

## it depends on rsyslog-dockerized 

cd ssh-trapper

sudo docker build -t ssh-trapper . 



## if you prefer to use docker-compose

sudo docker run  -dti --name ssh-trapper ssh-trapper  sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


