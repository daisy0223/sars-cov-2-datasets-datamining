version 1.0

workflow Pangolin {

  input {
    String  samplename
    File    consensus_seq
    String  pangolin_docker_image = "staphb/pangolin:2.4.2-pangolearn-2021-05-19"
  }
  call pangolin {
    input:
      samplename = samplename,
      fasta = consensus_seq,
      docker = pangolin_docker_image
  }
}

task pangolin {
  input {
    File        fasta
    String      samplename
    String      docker
  }
  command{
    # date and version control
    date | tee DATE
    echo "$(pangolin -v); $(pangolin -pv)" | tee VERSION
    set -e

    pangolin "~{fasta}" \
       --outfile "~{samplename}.pangolin_report.csv" \
       --verbose

    pangolin_lineage=$(tail -n 1 ${samplename}.pangolin_report.csv | cut -f 2 -d "," | grep -v "lineage")

    pangolin_probability=$(tail -n 1 ${samplename}.pangolin_report.csv | cut -f 3 -d "," )
    mv ${samplename}.pangolin_report.csv ${samplename}_pango2_lineage.csv

    echo $pangolin_lineage | tee PANGOLIN_LINEAGE
    echo $pangolin_probability | tee PANGOLIN_PROBABILITY
  }

  output {
    String     date                 = read_string("DATE")
    String     version              = read_string("VERSION")
    String     pangolin_lineage     = read_string("PANGOLIN_LINEAGE")
    String     pangolin_aLRT        = read_string("PANGOLIN_PROBABILITY")
    String     pangolin_docker      = docker
    File       pango_lineage_report = "~{samplename}_pango2_lineage.csv"
  }

  runtime {
    docker:     "~{docker}"
    memory:       "8 GB"
    cpu:          40
    disks:        "local-disk 100 SSD"
    preemptible:  0
  }
}
