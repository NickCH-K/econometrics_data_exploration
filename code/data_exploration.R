## Libraries
library(tidyverse)
library(jtools)
library(vtable)
library(car)
library(huxtable)
library(purrr)
library(estimatr)
library(lubridate)


## Load data
files_trend <- list.files(path = 'data/', pattern='trends_up_to', full.names=TRUE)
df_md_earning <- read_csv('data/Most+Recent+Cohorts+(Scorecard+Elements).csv')


## Data Wrangling
df_num_search <- map_df(files_trend, read_csv) %>% bind_rows() %>%
  na.omit() %>%
  mutate(week_start = as.Date(str_sub(monthorweek,1,10))) %>% 
  mutate(year = year(week_start), month = month(week_start)) %>%
  select('schname', 'index', 'year', 'month') %>%
  mutate_if(is.character, str_to_upper) %>%
  na.omit() %>% group_by(schname) %>% count() %>% drop_na()



df_md_earning_locality <- df_md_earning %>% filter(PREDDEG == '3') %>%
  select('UNITID', 'OPEID', 'INSTNM', 'md_earn_wne_p10-REPORTED-EARNINGS', 'LOCALE') %>%
  rename('schname' = 'INSTNM', md_earn = 'md_earn_wne_p10-REPORTED-EARNINGS') %>%
  mutate_if(is.character, str_to_upper) %>%
  na.omit() %>%
  transform(md_earn = as.numeric(md_earn)) %>%
  mutate(locality = case_when(LOCALE == 11 ~ 'city_large',
                              LOCALE == 12 ~ 'city_mid',
                              LOCALE == 13 ~ 'city_small',
                              LOCALE == 21 ~ 'sub_large',
                              LOCALE == 22 ~ 'sub_mid',
                              LOCALE == 23 ~ 'sub_small',
                              LOCALE == 31 ~ 'town_large',
                              LOCALE == 32 ~ 'town_mid',
                              LOCALE == 33 ~ 'town_small',
                              LOCALE == 41 ~ 'Rural_large',
                              LOCALE == 42 ~ 'Rural_mid',
                              LOCALE == 43 ~ 'Rural_small')) #%>% group_by(locality)




df_combined_locality <- df_md_earning_locality %>% full_join(df_num_search, by = 'schname') %>% drop_na() %>%
  select('schname', 'md_earn', 'n', 'locality') %>% rename(num_search = 'n')



df_combined_locality <- subset(df_combined_locality, grepl('^\\d+$', df_combined_locality$md_earn)) %>% transform(md_earn = as.numeric(md_earn))
df_combined_locality <- subset(df_combined_locality, grepl('^\\d+$', df_combined_locality$num_search))



# define “high-earning” and “low-earning” colleges. 
##first method: by calculating t and its sd~ 1.96
mean_earning <- df_combined_locality %>% pull(md_earn) %>% na.omit() %>% mean()
std_dev_earning <- df_combined_locality %>% pull(md_earn) %>% na.omit() %>% sd()

df_combined_locality <- df_combined_locality %>%
  mutate(total_earning_sd =(md_earn - mean_earning)/ std_dev_earning)

#seconed method(used here): by calculation of median of data
df_combined_locality$lg_md = log(df_combined_locality$md_earn)           # normalize data
ggplot(data = df_combined_locality) +
  geom_histogram(mapping = aes(lg_md))

md_of_md_earn <- median(df_combined_locality$lg_md)

# creating a column called "earning_code" with code 1 for low earning schools
high_earning <- subset(df_combined_locality, df_combined_locality$lg_md >= md_of_md_earn)
high_earning$earning_code <- 1

# creating a column called "earning_code" with code 0 for low earning schools
low_earning <- subset(df_combined_locality, df_combined_locality$lg_md <= md_of_md_earn)
low_earning$earning_code <- 0

# combining high earning and low earning schools
total_school <- rbind(high_earning,low_earning)



## Look at the data
ls(df_combined_locality)
head(df_combined_locality)
summary(df_combined_locality)

## Look at the data
ls(total_school)
head(total_school)
summary(total_school)


## Plot data
ggplot(data = total_school) +
  geom_point(mapping = aes(md_earn, num_search, color = locality)) +
  geom_smooth(mapping = aes(md_earn, num_search))


## Build regression model
reg_total_uni_var <- lm(num_search ~ earning_code, data = total_school)
plot_coefs(reg_total_uni_var)
effect_plot(reg_total_uni_var, pred = 'earning_code', plot.points = TRUE)
reg_total_uni_var$coefficients
summary(reg_total_uni_var)



reg_total_uni_var_log <- lm(log(num_search) ~ earning_code, data = total_school)
plot_coefs(reg_total_uni_var_log)
effect_plot(reg_total_uni_var_log, pred = 'earning_code', plot.points = TRUE)
reg_total_uni_var_log$coefficients
summary(reg_total_uni_var)



reg_total_uni_var_factor <- lm(num_search ~ earning_code + factor(locality), data = total_school)
plot_coefs(reg_total_uni_var)
effect_plot(reg_total_uni_var, pred = 'earning_code', plot.points = TRUE)
reg_total_uni_var$coefficients
summary(reg_total_uni_var)


export_summs(reg_total_uni_var, reg_total_uni_var_log, reg_total_uni_var_factor)
