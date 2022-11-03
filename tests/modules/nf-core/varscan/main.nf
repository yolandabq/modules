#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { VARSCAN } from '../../../../modules/nf-core/varscan/main.nf'

workflow test_varscan {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['homo_sapiens']['illumina']['test_mpileup'], checkIfExists: true)
    ]

    VARSCAN ( input )
}
