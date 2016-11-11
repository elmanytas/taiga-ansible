#!/bin/bash

set -e

# Add nginx command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- taiga-front-dist "$@"
fi

if [ "$1" = 'taiga-front-dist' ]; then
	# Reconfigure taiga-front-dist:
	# * reconfigure ansible inventory
	# * launch ansible with config tag+
	
	
fi

# As argument is not related to taiga-front-dist,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
