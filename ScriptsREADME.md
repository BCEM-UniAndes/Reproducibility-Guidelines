 

# SCRIPTS

## Content

1. READMEs
   - [DBCAN_all.sh](###DBCAN_all.sh)
   - [dbcan.sh](###dbcan.sh)
   - [prodigal.sh](###prodigal.sh)
   - [prodigalMetagenome.sh](###prodigalMetagenome.sh)
   - [prodigalHungate.sh](###prodigalHungate.sh)

### DBCAN_all.sh

#### How to Run (Example)

**Runs just for 46 proteomes at a time due to magnus restrictions **

sbatch DBCAN_all.sh ~/ProyectoBanRep/HungateData/genomes_2_46.txt ~/ProyectoBanRep/HungateData/ProteomeAnnotations/ /hpcfs/home/lc.camelo10/ProyectoBanRep/dbcan/databases/

#### Directory

 [/hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/](/hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/)

#### Function 

Run for all the proteomes in the list  (parameter #1)

#### Parameters

  1. List of proteome paths
  2. Directory where the output directories will be allocated
  3. directory path where the CAZy and others databases used by dbCAN are

#### Outputs

script progress can be seen at  /hpcfs/home/lc.camelo10/ProyectoBanRep/Outputs/dbCANloop.o%j

dbCAN2 output files:

1.  uniInput - The unified input file for the rest of the tools .faa file

2. Hotpep.out - the output from the Hotpep run
3. diamond.out - the output from the diamond blast
4. hmmer.out - the output from the hmmer run

Each proteome will have an output directory allocated in parameter #2

### dbcan.sh 

#### How to Run (Example)

sbatch dbcan.sh /hpcfs/home/maxplanck/RumenMicrobiomeDB/Hungate1000/LacbacXBB2008_FD/Assembly/IMG_Data/51254.assembled.faa /hpcfs/home/lc.camelo10/ProyectoBanRep/dbcan/output_HungateTest /hpcfs/home/lc.camelo10/ProyectoBanRep/dbcan/databases/ 

#### Directory

 [/hpcfs/home/lc.camelo10/ProyectoBanRep/dbcan](/hpcfs/home/lc.camelo10/ProyectoBanRep/dbcan)

#### Function

Uses the protein predictions (.faa file) to obtain the CAZy annotations usign hmmer, diamond and hotpep. The proteins are obtained from a proteome file. 

#### Parameters

1. List of proteomes
2. output directory path
3. directory path where the CAZy and others databases used by dbCAN are

#### Outputs

program progress can be seen at  /hpcfs/home/lc.camelo10/ProyectoBanRep/Outputs/dbcan.o%j

dbCAN2 output files:

1.  uniInput - The unified input file for the rest of the tools .faa file
2. Hotpep.out - the output from the Hotpep run
3. diamond.out - the output from the diamond blast
4. hmmer.out - the output from the hmmer run

### prodigal.sh

#### How to Run (Example)

sbatch /hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/prodigal.sh my.metagenome.fna my.genes my.proteins.faa

#### Directory

[/hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/](/hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/)

#### Function

Run prodigal for genomes

#### Parameters

1. genome assembly (nucleotide)
2. gene coordinates output filename (.gff)
3. proteins translation output filename (.faa)

#### Outputs

program progress can be seen at /hpcfs/home/lc.camelo10/ProyectoBanRep/Outputs/prodigal.o%j

prodigal output files:

1.  gene coordinates output (.gff)
2.  proteins translation output (.faa)

### prodigalMetagenome.sh

#### How to Run (Example)

sbatch /hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/prodigalMetagenome.sh my.metagenome.fna my.genes my.proteins.faa

#### Directory

[/hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/](/hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/)

#### Function

Run prodigal for metagenomes

#### Parameters

1. metagenome contigs (nucleotide)
2. gene coordinates output filename (.gff)
3. proteins translation output filename (.faa)

#### Outputs

program progress can be seen at /hpcfs/home/lc.camelo10/ProyectoBanRep/Outputs/prodigalMeta.o%j

prodigal output files:

1.  gene coordinates output (.gff)
2.  proteins translation output (.faa)

### prodigalHungate.sh

#### How to Run (Example)

**Runs just for 23 genomes at a time due to magnus restrictions**

sbatch /hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/prodigalHungate.sh /hpcfs/home/lc.camelo10/ProyectoBanRep/HungateData/listGenomeswithoutProteome /hpcfs/home/lc.camelo10/ProyectoBanRep/HungateData/ProteomePredictions/

#### Directory

[/hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/](/hpcfs/home/lc.camelo10/ProyectoBanRep/Scripts/)

#### Function

Run prodigal for all the genomes in the list (Parameter 1) 

#### Parameters

1. metagenome contigs (nucleotide)
2. gene coordinates output filename (.gff)

#### Outputs

program progress can be seen at /hpcfs/home/lc.camelo10/ProyectoBanRep/Outputs/prodigalMeta.o%j

prodigal output files:

1.   List of genome paths of the Hungate project
2.  output directory where the proteomes of the genomes in Parameter #1 will be allocated

