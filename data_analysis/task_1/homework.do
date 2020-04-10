/* Task 1. Сreating an “age” variable which represents the age of a person in years */
generate int age = . // or generate int age = 0 for values generation


/* Task 2. Renaming the variable “q1” to “gender” */
rename q1 gender


/* Task 3. Giving to the “age” variable the label “Age in years” */
label variable age "Age in years"


/* Task 4(a). Amount of unique value labels the file (36) */
label list

/*
unionlbl:
           0 nonunion
           1 union
smsalbl:
           0 nonSMSA
           1 SMSA
gradlbl:
           0 not college grad
           1 college grad
marlbl:
           0 single
           1 married
racelbl:
           1 white
           2 black
           3 other
indlbl:
           1 Ag/Forestry/Fisheries
           2 Mining
           3 Construction
           4 Manufacturing
           5 Transport/Comm/Utility
           6 Wholesale/Retail Trade
           7 Finance/Ins/Real Estate
           8 Business/Repair Svc
           9 Personal Services
          10 Entertainment/Rec Svc
          11 Professional Services
          12 Public Administration
occlbl:
           1 Professional/technical
           2 Managers/admin
           3 Sales
           4 Clerical/unskilled
           5 Craftsmen
           6 Operatives
           7 Transport
           8 Laborers
           9 Farmers
          10 Farm laborers
          11 Service
          12 Household workers
          13 Other
*/


/* Task 4(b).
	Managers/admins participated in the research: 264
	The percent of Professional/technical out of all the research participants: 14.11
	The percent of Professional/technical out of the research participants that gave valid information about their occupation: 14.17
*/

tab occupation, missing

/*
            occupation |      Freq.     Percent        Cum.
-----------------------+-----------------------------------
Professional/technical |        317       14.11       14.11
        Managers/admin |        264       11.75       25.87
                 Sales |        726       32.32       58.19
    Clerical/unskilled |        102        4.54       62.73
             Craftsmen |         53        2.36       65.09
            Operatives |        246       10.95       76.05
             Transport |         28        1.25       77.29
              Laborers |        286       12.73       90.03
               Farmers |          1        0.04       90.07
         Farm laborers |          9        0.40       90.47
               Service |         16        0.71       91.18
     Household workers |          2        0.09       91.27
                 Other |        187        8.33       99.60
                     . |          9        0.40      100.00
-----------------------+-----------------------------------
                 Total |      2,246      100.00
*/

tab occupation

/*
            occupation |      Freq.     Percent        Cum.
-----------------------+-----------------------------------
Professional/technical |        317       14.17       14.17
        Managers/admin |        264       11.80       25.97
                 Sales |        726       32.45       58.43
    Clerical/unskilled |        102        4.56       62.99
             Craftsmen |         53        2.37       65.36
            Operatives |        246       11.00       76.35
             Transport |         28        1.25       77.60
              Laborers |        286       12.78       90.39
               Farmers |          1        0.04       90.43
         Farm laborers |          9        0.40       90.84
               Service |         16        0.72       91.55
     Household workers |          2        0.09       91.64
                 Other |        187        8.36      100.00
-----------------------+-----------------------------------
                 Total |      2,237      100.00
*/

/* Task 4(c). The same algorithms as in classroom */

egen mode = mode(age)
tabulate mode

/*
       mode |      Freq.     Percent        Cum.
------------+-----------------------------------
         35 |      2,246      100.00      100.00
------------+-----------------------------------
      Total |      2,246      100.00
*/

summarize age, detail

/*
                     age in current year
-------------------------------------------------------------
      Percentiles      Smallest
 1%           34             34
 5%           35             34
10%           35             34       Obs               2,246
25%           36             34       Sum of Wgt.       2,246

50%           39                      Mean           39.15316
                        Largest       Std. Dev.      3.060002
75%           42             45
90%           44             45       Variance       9.363614
95%           44             46       Skewness       .2003234
99%           45             46       Kurtosis       1.932389
*/

tabstat age, stats(iqr, range)

/*
    variable |       iqr     range
-------------+--------------------
         age |         6        12
----------------------------------
*/

/*
	Mode: 35
	Median: 39
	Mean: 39.15316
	Range: 34-45 (12)
	Standard deviation: 3.060002
	S. E. mean: .0645679
	Interquartile range: 6
	Quartile deviation (iqr / 2): 6 / 2 = 3
	Decile ratio (p90 / p10): = 44 / 35 = 1.257
*/

tabstat age, stats(skewness, kurtosis)

/*
    variable |  skewness  kurtosis
-------------+--------------------
         age |  .2003234  1.932389
----------------------------------
*/
/*
	The skewness of distribution is .2003234 and kurtosis is 1.932389.
	Due to this fact, distribution is positively skewed because skewness
	is positive (more than 0) and platykurtic because the kurtosis is less than 3.
*/

histogram age, bin(20) frequency normal
graph export "/Users/mvshmakovmv/Desktop/1.png", as(png) replace
// For histogram


/* Task 4(d). Indicate the mean age for those who are married and not married */

tabstat age, stats(mean), if married == 1

/*
    variable |      mean
-------------+----------
         age |   39.1165
------------------------
*/

tabstat age, stats(mean), if married == 0

/*
    variable |      mean
-------------+----------
         age |  39.21891
------------------------
*/


/* Task 4(e). Indicate the maximum age of those who are not married and have the tenure variable greater than 50 */

tabstat age, stats(max), if married == 0 & tenure > 50 

/*
    variable |       max
-------------+----------
         age |        45
------------------------
*/


/* Task 4(f). How many college graduates are marries, what is the percent of college graduates that are marries? */

tabstat age, stats(count), if collgrad == 1 & married == 1

/*
    variable |         N
-------------+----------
         age |       344
------------------------
*/

tabstat age, stats(count)

/*
    variable |         N
-------------+----------
         age |      2246
------------------------
*/
/*
	How many? 344
	Percent: 15,31%
*/


/* Task 4(g). How many research participants have the following characteristics:
- are not marries,
- are not college graduates,
- are not members of the inion. 
*/

tabstat age, stats(count, mean, sd), if married == 0 & collgrad == 0 & union == 0

/*
    variable |         N      mean        sd
-------------+------------------------------
         age |       361  39.34072  3.030902
--------------------------------------------
*/

/* If needed to separate the groups, then use the following:
	tabstat age, stats(count, mean, sd), if married == 0
	tabstat age, stats(count, mean, sd), if collgrad == 0
	tabstat age, stats(count, mean, sd), if union == 0
*/
 
