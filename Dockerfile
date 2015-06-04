FROM debian:jessie

MAINTAINER Antoine GIRARD <antoine.girard [at] sapk.fr>

RUN apt-get update && \
    apt-get upgrade -q -y && \
    apt-get install -q -y --no-install-recommends openjdk-7-jre-headless wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget "$(wget -nv https://github.com/takezoe/gitbucket/releases/latest/ -O /dev/null 2>&1 |  sed 's/.*\URL:\(https.*\) \[.*\] .*/\1/' | sed 's/tag/download/')/gitbucket.war" -O /opt/gitbucket.war

RUN adduser --quiet --shell /bin/false --disabled-login --home /home/git git 

ADD scripts/start-gitbucket.sh /opt/start-gitbucket.sh

VOLUME /home/git

# Port for web page
EXPOSE 80
# Port for SSH access to git repository (Optional)
EXPOSE 22

#Need to figure out why the /home/git doesn't belong to git
#USER git

CMD ["/bin/sh", "/opt/start-gitbucket.sh"] 
