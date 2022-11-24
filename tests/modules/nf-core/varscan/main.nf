#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { VARSCAN } from '../../../../modules/nf-core/varscan/main.nf'

workflow test_varscan {

    input = [
        [ id:'test', single_end:false ], // meta map
        file("./testdata/Sample1_T1.mpileup", checkIfExists: true)
    ]

    VARSCAN ( input )
}
