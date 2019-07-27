#!/bin/bash

set -e

# ml nextflow/19.04.1

infile="local_inputs/hello-in.txt"

nextflow \
    run \
    hello.nf \
    --infile "$infile" \
    -resume
