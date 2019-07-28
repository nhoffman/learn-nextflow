#!/usr/bin/env nextflow

infile = file(params.infile)
outfile = infile.getSimpleName() + '.md5'

process md5sum {
    publishDir "$params.outdir/"

    container "ubuntu:18.04"
    cpus 1
    memory "2 GB"

    input:
	file input from infile
    	val output from outfile

    output:
	file output into md5

    """
    md5sum $input > $output
    """
}

md5.subscribe { print "$it" }
