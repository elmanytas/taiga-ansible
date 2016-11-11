FROM ubuntu:16.04

MAINTAINER Jose Manuel Ferrer Mosteiro <jmferrer.paradigma@gmail.com>

ENV git_repo=taiga-ansible
ENV git_user_base=https://github.com/elmanytas
ENV docker_ansible_tag=docker-taiga-front-dist

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update; \
    apt-get -y install ansible python-apt git

# This does not work anymore: https://github.com/docker/docker/issues/2745
#COPY ../.. /etc/ansible
# Workarounded in build-image.sh
COPY ansible/ /etc/ansible/

RUN ansible-playbook  /etc/ansible/site.yml --tags=$docker_ansible_tag

RUN apt-get -y remove ansible python-apt; \
    apt-get -y autoremove; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80

CMD ["taiga-front-dist"]
