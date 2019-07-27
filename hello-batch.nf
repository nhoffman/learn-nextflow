#!/usr/bin/env nextflow


process md5sum {
    container "ubuntu:18.04"
    cpus 1
    memory "2 GB"

    input:
	file infile from params.infile

    """
    md5sum $infile
    """
}
