#!/bin/bash

set -e

# Add nginx command if needed
if [ "${1:0:1}" = '-' ]; then
	  set -- nginx "$@"
fi

if [ "$1" = 'nginx' ]; then
    # Reconfigure taiga-front-dist:
    # * reconfigure ansible inventory
	  # * launch ansible with config tag:
	  #   ansible-playbook  /etc/ansible/site.yml --tags=config-${docker_ansible_tag}
	  if [ "$taiga_back_hostname" ]; then
        /bin/sed -i "s/^taiga_back_hostname.*/taiga_back_hostname=$taiga_back_hostname/" /etc/ansible/hosts
				ansible-playbook /etc/ansible/site.yml --tags=config-${docker_ansible_tags}
		fi
fi

# As argument is not related to taiga-front-dist,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
