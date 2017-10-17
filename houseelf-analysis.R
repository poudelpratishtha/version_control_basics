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