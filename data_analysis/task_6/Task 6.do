/Users/mvshmakovmv/Desktop/projects/hse_data_analysis/task_6/data_games.dta
use "/Users/mvshmakovmv/Desktop/projects/hse_data_analysis/task_6/data_games.dta"
reg price mpg trunk length weight foreign
use "/Users/mvshmakovmv/Downloads/Worldbank_data.dta"
use "/Users/mvshmakovmv/Downloads/Youtube_data.dta"
use "/Users/mvshmakovmv/Desktop/projects/hse_data_analysis/task_6/data_games.dta"
reg payment mpg trunk length weight foreign
reg payment payment_type payment_method crystalls_balance_before_buy crystalls_bought
reg payment payment_type payment_method crystalls_balance_before_buy crystalls_bought
predict r
predict r, resid
r resid
swilk r
kdensity r, normal
estat vif
estat hettest
dfbeta
rvfplot
tabstat _dfbeta_1
