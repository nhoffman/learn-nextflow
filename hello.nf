#!/usr/bin/env nextflow

process md5sum {

    publishDir "local_outputs"

    input:
	val outfile from "${file(params.infile).getName()}.md5"
	file infile name params.infile from params.infile

    output:
	file "${outfile}" into md5

    """
    md5sum $infile > $outfile
    """

}

md5.subscribe { print "$it" }
