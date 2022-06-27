library(stringr)
library(dplyr)

a <- readxl::read_xlsx('Facet2017 A_품목유형_AI번역요청.xlsx', sheet = '2017facet_A품목유형')
b <- readxl::read_xlsx('Facet2017 B_식품원_AI번역요청.xlsx', sheet = '2017facet_B식품원')

df <- bind_rows(a,b)

extract <- str_extract_all(df$Descriptor, '\\(.*?\\)') %>% unlist() %>% unique() %>% data.frame()

writexl::write_xlsx(extract, '괄호단어추출.xlsx')


