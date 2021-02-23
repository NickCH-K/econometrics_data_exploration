# econometrics_data_exploration
econometrics_data_exploration

#data load and data wrangling & manipulation,

I just used 'trends_up_to' & 'Most+Recent+Cohorts+(Scorecard+Elements)' files. started with 'list.files()' function to read the 'trends_up_to' and
'read_CSV' to read 'Most+Recent+Cohorts+(Scorecard+Elements)' file.

get to number of searches by each university: for 'list.files()' map_df applyed to read files, then omit na variables mutate to divide 'monthorweek' to 'month' and 'year
' variables'(those two didn't really worked for me).
then grouped_by(schname)&count to get the number of searches by each university.
get to earning by university: used, filter(PREDDEG == '3') to filter for 'universities predominantly grant bachelor’s degrees'. I also used mutate to clarifying lacality factor.
Then both data sets joined by 'schname' as key.



# define “high-earning” and “low-earning” colleges.(univariate method)
As I searched I found two approache to define 'high-earning' & 'low-earning' universities. 
First method: by calculating t statistics. 
Second metod: by calculation of normalized median of data(univariate method) 
I put both methods there. but used second one for my calculations. step1.normalize data - step2.creating a column called "earning_code" with code 1 for
'high-earning' schools and 0 for 'low-earning' schools. step3.combining high earning and low earning schools.

# Look at the data and plotting.
use three general functions: ls(), head(), and summary() too look at the data. then plot our data by ggplot

# Build regression model
for each model used plot_coefs() & effect_plot() to graph the model. and data$coefficients & summary(data) to get idea of how good our fit is.

## model 1 (reg_total_uni_var) : I regressed "number of search" vs. "earning code" by linear regression. 
Residuals:
    Min      1Q  Median      3Q     Max 
-390.37 -167.12  -11.12  144.88 1325.63 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   479.122      7.905  60.609  < 2e-16 ***
earning_code   67.250     11.176   6.018 2.25e-09 ***

## model 2 (reg_total_uni_var_log): I regressed log"number of search" vs. "earning code" and it looked nonlinear.
Residuals:
    Min      1Q  Median      3Q     Max 
-390.37 -167.12  -11.12  144.88 1325.63 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   479.122      7.905  60.609  < 2e-16 ***
earning_code   67.250     11.176   6.018 2.25e-09 ***

## model 3 (reg_total_uni_var_factor): I regressed log"number of search" vs. "earning code" and also added locality as factor to the model.
Residuals:
    Min      1Q  Median      3Q     Max 
-390.37 -167.12  -11.12  144.88 1325.63 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   479.122      7.905  60.609  < 2e-16 ***
earning_code   67.250     11.176   6.018 2.25e-09 ***


for all three models:
F-statistic: 36.21 on 1 and 1427 DF,  p-value: 2.247e-09
So, regarding p-value all three models are significant models. regarding export_summs() result it looks that model 3,
can describe relationships between the data better than others.
 
Show in New WindowClear OutputExpand/Collapse Output
Error: 'data/Most+Recent+Cohorts+(Scorecard+Elements).csv' does not exist in current working directory ('E:/R_projects/EM_DEproject/econometrics_data_exploration/webpage').
Show in New WindowClear OutputExpand/Collapse Output
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
16 parsing failures.
 row col  expected    actual                           file
1561  -- 6 columns 5 columns 'data/trends_up_to_finish.csv'
1562  -- 6 columns 2 columns 'data/trends_up_to_finish.csv'
1563  -- 6 columns 5 columns 'data/trends_up_to_finish.csv'
1564  -- 6 columns 2 columns 'data/trends_up_to_finish.csv'
1565  -- 6 columns 5 columns 'data/trends_up_to_finish.csv'
.... ... ......... ......... ..............................
See problems(...) for more details.
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
2 parsing failures.
   row   col expected                                                  actual                            file
150976 schid a double Rising searches for cuny kingsborough community college 'data/trends_up_to_inter_1.csv'
150977 schid a double cuny jobs                                               'data/trends_up_to_inter_1.csv'
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
888 parsing failures.
 row col  expected    actual                            file
1094  -- 6 columns 5 columns 'data/trends_up_to_inter_3.csv'
1095  -- 6 columns 2 columns 'data/trends_up_to_inter_3.csv'
1096  -- 6 columns 5 columns 'data/trends_up_to_inter_3.csv'
1097  -- 6 columns 2 columns 'data/trends_up_to_inter_3.csv'
1098  -- 6 columns 5 columns 'data/trends_up_to_inter_3.csv'
.... ... ......... ......... ...............................
See problems(...) for more details.
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
996 parsing failures.
 row col  expected    actual                            file
1093  -- 6 columns 5 columns 'data/trends_up_to_inter_5.csv'
1094  -- 6 columns 2 columns 'data/trends_up_to_inter_5.csv'
1095  -- 6 columns 5 columns 'data/trends_up_to_inter_5.csv'
1096  -- 6 columns 2 columns 'data/trends_up_to_inter_5.csv'
1097  -- 6 columns 5 columns 'data/trends_up_to_inter_5.csv'
.... ... ......... ......... ...............................
See problems(...) for more details.
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
964 parsing failures.
 row col  expected    actual                            file
3279  -- 6 columns 5 columns 'data/trends_up_to_inter_6.csv'
3280  -- 6 columns 2 columns 'data/trends_up_to_inter_6.csv'
3281  -- 6 columns 5 columns 'data/trends_up_to_inter_6.csv'
3282  -- 6 columns 2 columns 'data/trends_up_to_inter_6.csv'
3283  -- 6 columns 5 columns 'data/trends_up_to_inter_6.csv'
.... ... ......... ......... ...............................
See problems(...) for more details.
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
Parsed with column specification:
cols(
  schid = col_double(),
  schname = col_character(),
  keyword = col_character(),
  keynum = col_double(),
  monthorweek = col_character(),
  index = col_double()
)
NAs introduced by coercion
Show in New WindowClear OutputExpand/Collapse Output
Info	
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

Show in New WindowClear OutputExpand/Collapse Output
[1] "earning_code"     "lg_md"            "locality"         "md_earn"          "num_search"       "schname"          "total_earning_sd"
   schname             md_earn         num_search       locality         total_earning_sd        lg_md         earning_code   
 Length:1429        Min.   : 17600   Min.   : 156.0   Length:1429        Min.   :-2.025122   Min.   : 9.776   Min.   :0.0000  
 Class :character   1st Qu.: 35100   1st Qu.: 314.0   Class :character   1st Qu.:-0.580811   1st Qu.:10.466   1st Qu.:0.0000  
 Mode  :character   Median : 40300   Median : 468.0   Mode  :character   Median :-0.151645   Median :10.604   Median :1.0000  
                    Mean   : 42132   Mean   : 512.8                      Mean   :-0.000424   Mean   :10.614   Mean   :0.5003  
                    3rd Qu.: 46500   3rd Qu.: 624.0                      3rd Qu.: 0.360054   3rd Qu.:10.747   3rd Qu.:1.0000  
                    Max.   :166200   Max.   :1872.0                      Max.   :10.239139   Max.   :12.021   Max.   :1.0000  
R Console
 
 
schname
<chr>
md_earn
<dbl>
2	UNIVERSITY OF ALABAMA AT BIRMINGHAM	40300	
4	UNIVERSITY OF ALABAMA IN HUNTSVILLE	46600	
6	THE UNIVERSITY OF ALABAMA	42400	
9	AUBURN UNIVERSITY	45400	
10	BIRMINGHAM SOUTHERN COLLEGE	41900	
23	SAMFORD UNIVERSITY	45800	
6 rows | 1-3 of 7 columns
data.frame
6 x 7
 
 
schname
<chr>
md_earn
<dbl>
num_search
<int>
locality
<chr>
total_earning_sd
<dbl>
lg_md
<dbl>
earning_code
<dbl>
2	UNIVERSITY OF ALABAMA AT BIRMINGHAM	40300	624	city_mid	-0.15164466	10.60411	1
4	UNIVERSITY OF ALABAMA IN HUNTSVILLE	46600	780	city_mid	0.36830719	10.74936	1
6	THE UNIVERSITY OF ALABAMA	42400	942	city_small	0.02167262	10.65490	1
9	AUBURN UNIVERSITY	45400	624	city_small	0.26926874	10.72327	1
10	BIRMINGHAM SOUTHERN COLLEGE	41900	468	city_mid	-0.01959340	10.64304	1
23	SAMFORD UNIVERSITY	45800	468	sub_large	0.30228156	10.73204	1
6 rows
Show in New WindowClear OutputExpand/Collapse Output
Info	
`geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

Show in New WindowClear OutputExpand/Collapse Output


 (Intercept) earning_code 
   479.12185     67.25018 

Call:
lm(formula = num_search ~ earning_code, data = total_school)

Residuals:
    Min      1Q  Median      3Q     Max 
-390.37 -167.12  -11.12  144.88 1325.63 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   479.122      7.905  60.609  < 2e-16 ***
earning_code   67.250     11.176   6.018 2.25e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 211.2 on 1427 degrees of freedom
Multiple R-squared:  0.02475,	Adjusted R-squared:  0.02406 
F-statistic: 36.21 on 1 and 1427 DF,  p-value: 2.247e-09

R Console
 (Intercept) earning_code 
   479.12185     67.25018 

Call:
lm(formula = num_search ~ earning_code, data = total_school)

Residuals:
    Min      1Q  Median      3Q     Max 
-390.37 -167.12  -11.12  144.88 1325.63 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   479.122      7.905  60.609  < 2e-16 ***
earning_code   67.250     11.176   6.018 2.25e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 211.2 on 1427 degrees of freedom
Multiple R-squared:  0.02475,	Adjusted R-squared:  0.02406 
F-statistic: 36.21 on 1 and 1427 DF,  p-value: 2.247e-09

Show in New WindowClear OutputExpand/Collapse Output

Using data total_school from global environment. This could cause incorrect results if total_school has been altered since the model was fit. You can
manually provide the data to the "data =" argument.
 (Intercept) earning_code 
   6.0715830    0.1584519 

Call:
lm(formula = num_search ~ earning_code, data = total_school)

Residuals:
    Min      1Q  Median      3Q     Max 
-390.37 -167.12  -11.12  144.88 1325.63 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   479.122      7.905  60.609  < 2e-16 ***
earning_code   67.250     11.176   6.018 2.25e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 211.2 on 1427 degrees of freedom
Multiple R-squared:  0.02475,	Adjusted R-squared:  0.02406 
F-statistic: 36.21 on 1 and 1427 DF,  p-value: 2.247e-09

R Console


Show in New WindowClear OutputExpand/Collapse Output


 (Intercept) earning_code 
   479.12185     67.25018 

Call:
lm(formula = num_search ~ earning_code, data = total_school)

Residuals:
    Min      1Q  Median      3Q     Max 
-390.37 -167.12  -11.12  144.88 1325.63 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   479.122      7.905  60.609  < 2e-16 ***
earning_code   67.250     11.176   6.018 2.25e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 211.2 on 1427 degrees of freedom
Multiple R-squared:  0.02475,	Adjusted R-squared:  0.02406 
F-statistic: 36.21 on 1 and 1427 DF,  p-value: 2.247e-09

R Console
 (Intercept) earning_code 
   479.12185     67.25018 

Call:
lm(formula = num_search ~ earning_code, data = total_school)

Residuals:
    Min      1Q  Median      3Q     Max 
-390.37 -167.12  -11.12  144.88 1325.63 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   479.122      7.905  60.609  < 2e-16 ***
earning_code   67.250     11.176   6.018 2.25e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 211.2 on 1427 degrees of freedom
Multiple R-squared:  0.02475,	Adjusted R-squared:  0.02406 
F-statistic: 36.21 on 1 and 1427 DF,  p-value: 2.247e-09

Show in New WindowClear OutputExpand/Collapse Output
                                           ─────────────────────────────────────────────────────────────────────────
                                                                               Model 1       Model 2       Model 3  
                                                                         ───────────────────────────────────────────
                                             (Intercept)                    479.12 ***      6.07 ***    492.67 ***  
                                                                             (7.91)        (0.02)       (13.47)     
                                             earning_code                    67.25 ***      0.16 ***     69.41 ***  
                                                                            (11.18)        (0.02)       (11.59)     
                                             factor(locality)city_mid                                     7.42      
                                                                                                        (19.69)     
                                             factor(locality)city_small                                  13.26      
                                                                                                        (18.80)     
                                             factor(locality)Rural_large                                -42.96      
                                                                                                        (31.81)     
                                             factor(locality)Rural_mid                                 -107.70 *    
                                                                                                        (43.21)     
                                             factor(locality)Rural_small                                -39.43      
                                                                                                        (55.80)     
                                             factor(locality)sub_large                                  -58.49 ***  
                                                                                                        (17.47)     
                                             factor(locality)sub_mid                                    -33.72      
                                                                                                        (36.93)     
                                             factor(locality)sub_small                                  -14.89      
                                                                                                        (44.46)     
                                             factor(locality)town_large                                 -21.98      
                                                                                                        (30.95)     
                                             factor(locality)town_mid                                   -16.34      
                                                                                                        (21.55)     
                                             factor(locality)town_small                                  10.40      
                                                                                                        (22.95)     
                                                                         ───────────────────────────────────────────
                                             N                             1429          1429          1429         
                                             R2                               0.02          0.03          0.04      
                                           ─────────────────────────────────────────────────────────────────────────
                                             *** p < 0.001; ** p < 0.01; * p < 0.05. 
