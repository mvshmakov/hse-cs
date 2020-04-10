/* Task 1 */

use "/Users/mvshmakovmv/Desktop/03.02.2020/salary.dta", clear

gen int new3 = .
replace new3 = 1 if position=="lecturer"
replace new3 = 2 if position=="docent"
replace new3 = 3 if position=="professor"
rename new3 position_id

gen double salary_after_tax_in_dollars = (salary * 0.3 * 0.016) if foreigner
> ==1

replace salary_after_tax_in_dollars = (salary * 0.13 * 0.016) if foreigner ==
> 0

egen salary_rank = rank(salary), field

gsort salary
gsort -salary

drop position
rename position_id position


/* Task 2 */

use "/Users/mvshmakovmv/Desktop/03.02.2020/data_games.dta", clear

drop if payment < 100 | payment > 14000

recode payment (100/500=1) (501/1000=2) (1001/2000=3) (2001/max=4), gen(payment_groups)
(103805 differences between payment and payment_groups)

egen payment_groups_mode = mode(payment_groups)
di payment_groups_mode


/* Task 3 */

use "/Users/mvshmakovmv/Desktop/03.02.2020/revenue.dta", clear


/* Task 4 */

use "/Users/mvshmakovmv/Desktop/03.02.2020/data_games.dta", clear

tab payment_method country if payment_method == 4, chi column
tab payment_method country if payment_method == 1, chi column
tab payment_method country if country == "RU", chi column
