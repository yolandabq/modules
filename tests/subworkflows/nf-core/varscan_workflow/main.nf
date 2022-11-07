#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { VARSCAN_WF } from '../../../../subworkflows/nf-core/varscan_workflow/main.nf'

workflow test_varscan_workflow {

    meta = [ id:'test', single_end:false ]
    bam = file(params.test_data['sarscov2']['illumina']['test_single_end_bam'], checkIfExists: true)
    bed = file(params.test_data['sarscov2']['genome']['test_bed'], checkIfExists: true)

    reads_bam = [meta, bam]
    reads_bed = [meta, bed]

    fasta = file("https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/genomics/homo_sapiens/genome/genome.fasta")

    input = [reads_bam, reads_bed, fasta]

    VARSCAN_WF ( input )
}

/*
VARSCAN_WF(

  INPUT_CHECK.out.reads_bam, INPUT_CHECK.out.reads_bed, ch_fasta

  )

  reads_bam // channel: [ meta, [ bam ] ]
  reads_bed // channel: [ meta, [ bed ] ]
  fasta


  input = [
      [ id:'test', single_end:false ], // meta map
      file(params.test_data['homo_sapiens']['illumina']['test_mpileup'], checkIfExists: true)
  ]
  */
