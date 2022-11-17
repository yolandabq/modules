#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { VARDICTJAVA } from '../../../../modules/nf-core/vardictjava/main.nf'

workflow test_vardictjava_bam {

    bam_input_ch = Channel.value([
        [ id:'test' ], // meta map
        file("./testdata/my.bam", checkIfExists: true),
        file("./testdata/my.bam.bai", checkIfExists: true),
        file("./testdata/my.bed", checkIfExists: true)
    ])

    fasta = file("./testdata/chr17_var_regions.fa", checkIfExists: true)
    fasta_fai = file("./testdata/chr17_var_regions.fa.fai", checkIfExists: true)

    VARDICTJAVA ( bam_input_ch, fasta, fasta_fai )
}
