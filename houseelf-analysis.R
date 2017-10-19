## Analyze house elves' data on ear length and dna sequences.

# Import data.
houseelf_data <- read.csv("data/houseelf_earlength_dna_data_1.csv", header=TRUE)

# Calculates GC_content percentage irrespective of string case.

library(stringr)

gc_content <- function(sequence){
  Gs <- str_count(sequence, regex('g', ignore_case = T))
  Cs <- str_count(sequence, regex('c', ignore_case = T))
  gc_content <- (Gs + Cs) / str_length(sequence) * 100
  return(gc_content)
}

get_size_class <- function(ear_length){
   # Calculate the size class for one or more earth lengths
   ear_lengths <- ifelse(ear_length > 10, "large", "small")
   return(ear_lengths)
}

# Creates a new data frame

new_df <- data.frame(id=houseelf_data$id, earlength_class=NA, gc_content=NA)
new_df$earlength_class <- sapply(houseelf_data$earlength, get_size_class)
new_df$gc_content <- sapply(houseelf_data$dnaseq, gc_content)

write.csv(new_df, "new_df_with_class&GCcontent.csv")
