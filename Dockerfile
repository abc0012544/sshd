FROM ubuntu:14.04
MAINTAINER Cao "caoqiang0012@163.com"

RUN echo "deb http://mirrors.163.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
 
#Install SSH Service
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh

#Setting root's password
RUN echo "root:Test1234" | chpasswd
 
#Cancel pam
RUN sed -ri 's/session required pam_loginuid.so/#session required pam_loginuid.so/g' /etc/pam.d/sshd
 
#Copy configuration file to correct persition, and give it to execute right
ADD authorized_keys /root/.ssh/authorized_keys
ADD run.sh /run.sh
RUN chmod 755 /run.sh
 
#Open Port
EXPOSE 22

#Setting Running Command
CMD ["/run.sh"]
