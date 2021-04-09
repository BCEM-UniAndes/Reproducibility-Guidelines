#!/usr/bin/bash


#SBATCH -p medium                        
#SBATCH -N 1                           
#SBATCH -n 1
#SBATCH --cpus-per-task=15
#SBATCH --mem=61440       
#SBATCH --time=73:00:00 
#SBATCH -o Outputs/trainRF.o%j
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lc.camelo10@uniandes.edu.co


######### How to Run #########
#sbatch scripts/trainRF.sh /hpcfs/home/lc.camelo10/JovenInvestigador/Outputs/Files/Data_PairedRelationsTRAINToTetramers.tsv

######### Description #########
# To Train the random forest model 
#Written by Laura Carolina Camelo Valera at Computational Biology and Microbial Ecology lab (BCEM)
#Institution: Los Andes University, Colombia
#email. lc.camelo10@uniandes.edu.co


######### Parameters #########
#1 Train matrix, phage-bacteria pairs

module load R/3.5.1mro

date 

echo "Predicting interactions ..."

Rscript ~/JovenInvestigador/RScripts/Train.R $1

echo "Model Implemented"

date
