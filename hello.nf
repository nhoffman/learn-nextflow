#!/usr/bin/env nextflow

infile = file(params.infile)
outfile = infile.getSimpleName() + '.md5'

process md5sum {

    publishDir "$params.outdir/"

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
