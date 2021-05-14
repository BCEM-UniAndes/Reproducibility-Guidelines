#######################################
######    script description     ######
#######################################
# To Test the random forest model, the train and test datasets must be loaded 
#Written by Laura Carolina Camelo Valera
#Written by Laura Carolina Camelo Valera at Computational Biology and Microbial Ecology lab (BCEM)
#Institution: Los Andes University, Colombia
#email. lc.camelo10@uniandes.edu.co


######### Parameters #########
#1 Train matrix, phage-bacteria pairs

#Activate arguments reading
args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}


#### Arguments Setting ####
train_PhageBacteriaPairs =  args[1]

#Required libraries
library(caret)
library(randomForest)
library(tictoc)
library(parallel)
library(doMC)

#Número de cores a usar    
registerDoMC(cores=15)

#Function File
source("~/JovenInvestigador/RScripts/functionsProject.R")

#Required data
Data_PairedRelations <- read.table(train_PhageBacteriaPairs,h=T,sep="\t")
#Data_PairedRelations_test <- read.table(test_PhageBacteriaPairs,h=T,sep="\t")
print("Datasets loaded")


#load("/hpcfs/home/lc.camelo10/JovenInvestigador/DataPairsTest.RData")
#load("/hpcfs/home/lc.camelo10/JovenInvestigador/DataPairsTrain.RData")

#to tetramers
Data_PairedRelations$Interaction<-as.factor(Data_PairedRelations$Interaction)
tic()
rf_PairedDistances=randomForest(y=Data_PairedRelations$Interaction,
                                         x=Data_PairedRelations[,10:152],
                                         subset=1:nrow(Data_PairedRelations))

toc()

saveRDS(rf_PairedDistances, "/hpcfs/home/lc.camelo10/JovenInvestigador/Outputs/model/rf_model.RDS")

