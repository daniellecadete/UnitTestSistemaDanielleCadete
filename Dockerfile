FROM jenkinsci/slave:latest

USER root
RUN apt-get update \

&& apt-get install -y sudo\
&& apt-get install -y maven\
&& apt-get install -y python\
&& rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

//RUN apt-get update
//RUN apt-get install -y python3
//RUN apt-get install -y python3-pip
//RUN apt-get install zip
