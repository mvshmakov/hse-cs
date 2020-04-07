use data_games.dta
describe

/* Task 1. Answers are taken from Frequency and Percent columns */

tabulate payment_method

/*
payment_meth |
          od |      Freq.     Percent        Cum.
-------------+-----------------------------------
fb_promotion |        498        0.47        0.47
     general |    103,278       97.89       98.36
    giftcard |         58        0.05       98.41
      mobile |      1,673        1.59      100.00
-------------+-----------------------------------
       Total |    105,507      100.00
*/

/* Task 2. */

egen mode = mode(crystall_bought)
tabulate mode

/*
       mode |      Freq.     Percent        Cum.
------------+-----------------------------------
         14 |    105,507      100.00      100.00
------------+-----------------------------------
      Total |    105,507      100.00
*/
// Mode is taken from this table

summarize crystalls_bought, detail

/*
                      crystalls_bought
-------------------------------------------------------------
      Percentiles      Smallest
 1%            0              0
 5%            5              0
10%            5              0       Obs             105,507
25%           14              0       Sum of Wgt.     105,507

50%           30                      Mean           51.36338
                        Largest       Std. Dev.      75.60694
75%           70            930
90%          120            963       Variance        5716.41
95%          210           1284       Skewness       3.620393
99%          450           1695       Kurtosis       22.12262
*/
/*
	From this table:
	- median is p50
	- range is [p1, p99]
	- mean, std.dev. is taken as-is
	- decile ratio is p90/p10

	Also, median, range, mean can be extracted with stats() function:
	- tabstat crystalls_bought, stats(range)
*/

tabstat crystalls_bought, stats(iqr)

/*

    variable |       iqr
-------------+----------
crystalls_~t |        56
------------------------
*/
/*
	- Interquartile range = 56,
	- Quartile deviation = 56/2 = 28
*/

histogram crystalls_bought, bin(20) frequency normal
graph export "C:\Users\Student\Desktop\1.png", as(png) replace

// For frequency histogram


/* Task 3 */

tabstat payment, stats(skewness, kurtosis, mean, median)
/*
    variable |  skewness  kurtosis      mean       p50
-------------+----------------------------------------
     payment |  3.115122   17.1964  1198.627       644
------------------------------------------------------
*/
/*
	The skewness of distribution is 3.115122 and kurtosis is 17.1964.
	Due to this fact, distribution is positively skewed because skewness
	is positive (more than 0) and leptokurtic because the kurtosis is more than 3.
*/

histogram payment, bin(20) frequency normal
graph export "/Users/mvshmakovmv/Desktop/1.png"", as(png) replace

// For frequency histogram
