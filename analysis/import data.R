library(readxl)
mod_df <- read_excel("data/IOTC-DATASETS-2025-03-12-NC-SCI_1950-2023.xlsx", 
                                                        sheet = "Catches_Captures", col_types = c("skip", 
                                                                                                  "skip", "skip", "skip", "skip", "text", 
                                                                                                  "skip", "numeric", "skip", "text", 
                                                                                                  "skip", "skip", "skip", "text", "skip", 
                                                                                                  "text", "skip", "skip", "skip", "skip", 
                                                                                                  "text", "skip", "text", "text", "skip", 
                                                                                                  "skip", "skip", "skip", "numeric", 
                                                                                                  "skip", "skip"))
View(mod_df)
