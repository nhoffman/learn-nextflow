#!/bin/bash

set -e

# ml nextflow/19.04.1

BASE_BUCKET="s3://fh-pi-fredricks-d/lab/nhoffman/$(basename $(pwd))"
infile="$BASE_BUCKET/hello-in.txt"

# aws s3 cp local_inputs/hello-in.txt $infile

nextflow \
    run \
    hello.nf \
    --infile "$infile" \
    -bucket-dir $BASE_BUCKET \
    -with-docker "ubuntu:18.04" \
    -resume
