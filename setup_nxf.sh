#!/bin/bash

# Set the NXF_HOME environment variable
NXF_HOME=$(pwd)/nxf_tests
NXF_WORK="$NXF_HOME/work"
NXF_CACHE="$NXF_HOME/cache"

# Check if the nxf_tests directory exists, if not, create it
if [[ ! -d "$NXF_HOME" ]]; then
    mkdir -p "$NXF_HOME"
fi

# Export env variables
export NXF_HOME
export NXF_WORK
export NXF_CACHE

# Check if Nextflow is already installed in NXF_HOME
if [[ ! -x "$NXF_HOME/nextflow" ]]; then
    curl -s https://get.nextflow.io | bash && mv nextflow "$NXF_HOME/" && chmod +x "$NXF_HOME/nextflow"
fi

# Run Nextflow with the given arguments
"$NXF_HOME/nextflow" "$@"
