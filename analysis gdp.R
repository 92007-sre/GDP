library(tidyverse)
library(janitor)
dir()

dir(path = "GDP Data")
"GDP Data/NAD-Arunachal_Pradesh-GSVA_cur_2015-16.csv" %>% 
  read_csv() -> df1
view(df1)
"NAD-Arunachal_Pradesh-GSVA_cur_2015-16.csv" %>% 
  str_split("-") %>% 
  unlist() -> state_name_vector

state_name_vector[2] -> st_name 



df1 %>% 
  slice(-c(7,11,27:33)) %>% 
  pivot_longer(-c(1,2), names_to ="year" , values_to ="gdsp" ) %>% 
  clean_names() %>% 
  select(-1) %>% 
  mutate(state = st_name) -> aab

view(aab)
  
