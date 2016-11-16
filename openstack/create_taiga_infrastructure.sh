#!/usr/bin/env bash
heat stack-create router --template-file=router-heat-template.yaml
sleep 15s
for component in postgresql redis taiga-back taiga-front-dist; do
    echo Creating $component
    heat stack-create $component --template-file=$component-heat-template.yaml
done
