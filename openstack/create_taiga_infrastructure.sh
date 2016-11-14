#!/usr/bin/env bash
for component in router postgresql taiga-back; do
    echo Creating $component
    heat stack-create $component --template-file=$component-heat-template.yaml
done
