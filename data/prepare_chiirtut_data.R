library(readr)
library(tidyverse)

##### EDGES #####
edgetable <- read_table2("chiir_tut/edgelist.dat", 
                                   col_names = FALSE)

edgetable<-edgetable%>%select(-X1)%>%
              rename(Source=X2,Target=X3)
  
write_csv(x=edgetable,'chiir_tut/facetoface_edgetable.csv')
  

#### NODES #####            
floor1<-c('DSE','SRH')
nodetable <- read_table2("chiir_tut/node_attributes.txt", 
                        col_names = FALSE)

nodetable <- nodetable %>% 
              rename(Id=X1,department=X2)%>%
                  mutate(floor=ifelse(department%in%floor1,1,0))

write_csv(x=nodetable,'chiir_tut/facetoface_nodetable.csv')


#When you prepare that kind of data be aware to call the 
# Id and nothing else in the nodetable
# aAnd 'Source' 'Target' in the edgetable



