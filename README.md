# Learning the basics of nextflow

Set up for all examples executed on the fred hutch cluster:

	ml nextflow/19.04.1
	module load awscli

Assumes account setup with credentials for the hard-coded S3 bucket
and permissions for AWS Batch.

## hello

A basic "hello world" demonstrating execution locally and via AWS batch.
