sysuse bpwide.dta /*open the dataset installed
with stata*/

//use external file
use "C:\Users\Student\Desktop\Data_Analysis\data_games.dta", clear

//clear the window
clear

generate new = . //create a new empty variable

// create a new empty variable based on existing one
generate bp_before_2 = bp_before * 2

describe //describe the dataset
desc

sum // basic summary statistic

tabulate agegrp //frequency table
tab agegrp

//frequency table, which takes into account the missing values
tab agegrp, missing

tab agegrp sex // contingency table

tabulate agegrp sex, column // column percentages

tabulate agegrp sex, row // row percentages

sum bp_before, detail //detailed summary statistics

//descriptive statistics
tabstat bp_before if agegrp==1 & sex==1, statistics(mean min max sum) by(sex)

//histogram with the normal curve
histogram bp_before, bin(20) frequency normal
