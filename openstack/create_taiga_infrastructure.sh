#!/usr/bin/env bash
for component in router postgresql taiga-back taiga-front-dist; do
    echo Creating $component
    heat stack-create $component --template-file=$component-heat-template.yaml
    sleep 20s
done
