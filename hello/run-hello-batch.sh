#!/bin/bash

set -e

# ml nextflow/19.04.1

BASE_BUCKET="s3://fh-pi-fredricks-d/lab/nhoffman/$(basename $(pwd))"
# infile="$BASE_BUCKET/hello-in.txt"
infile="local_inputs/hello-in.txt"

# Question:
# reproducible-workflows/nextflow/align-proteins-diamond/align-proteins-diamond.nf
# does not include -bucket-dir - why not?

# Question: why does the container need to be specified both here
# ("-with-docker") and in the process definition?

nextflow \
    run \
    hello-batch.nf \
    --infile "$infile" \
    --outdir $BASE_BUCKET/output \
    -bucket-dir $BASE_BUCKET \
    -c nextflow-batch.config \
    -with-docker "ubuntu:18.04" \
    -resume
