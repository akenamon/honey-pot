FROM ubuntu:16.04
MAINTAINER vinicius.torino@protonmai.com
RUN apt-get update && apt-get install -y openssh-server rsyslog
RUN mkdir /var/run/sshd
RUN echo '*.*  @rsyslog' > /etc/rsyslog.d/60-rsyslog.conf
RUN echo 'root:12345678' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE="in users profile"                                                                                         
RUN echo "export VISIBLE=now" >> /etc/profile                                                                                            
RUN echo "service rsyslog start" >> /root/.profile                                                                                       
RUN echo 'logger -t [DANGER] "we were HACKED"' >> /root/.profile                                                                         
EXPOSE 22                                                                                                                    
ENTRYPOINT ["/usr/sbin/sshd" "-D"] 
