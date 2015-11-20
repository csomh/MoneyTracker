@echo off

SET test_name=test_09_change_default_category_transactions

rem clean log file for actual results
del %test_name%.actual > nul 2>&1
rem clean log file for expected results
del %test_name%.expected > nul 2>&1

(
echo default_wallet = my.wallet
echo default_income_category = really big income category
echo default_spending_category = really big spend category
) > moneytracker.config

(
echo default_wallet = my.wallet
) > moneytracker.config.expected


rem ============================ TEST 0 ========================================
(
echo Example #0
echo [TEST: output]
moneytracker config default_income_category = "really big income category"
moneytracker config default_spending_category = "really big spend category"
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_income_category = really big income category
echo default_spending_category = really big spend category
) >> moneytracker.config.expected

(
echo Example #0
echo [TEST: output]
echo 'really big income category' was configured as default.
echo 'really big spend category' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 1 ========================================
(
echo Example #1
echo [TEST: output]
moneytracker config default_income_category = "big income"
moneytracker config default_spending_category = "big spend"
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
echo default_income_category = big income
echo default_spending_category = big spend
) > moneytracker.config.expected

(
echo Example #1
echo [TEST: output]
echo 'big income' was configured as default.
echo 'big spend' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 2 ========================================
(
echo Example #2
echo [TEST: output]
moneytracker config default_income_category = ""
moneytracker config default_spending_category = ""
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
echo default_income_category =
echo default_spending_category =
) > moneytracker.config.expected

(
echo Example #2
echo [TEST: output]
echo No 'default_income_category' is configured as default.
echo No 'default_spending_category' is configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 3 ========================================
(
echo Example #3
echo [TEST: output]
moneytracker config default_income_category = "   "
moneytracker config default_spending_category = "   "
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
echo default_income_category =
echo default_spending_category =
) > moneytracker.config.expected

(
echo Example #3
echo [TEST: output]
echo No 'default_income_category' is configured as default.
echo No 'default_spending_category' is configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 4 ========================================
(
echo default_wallet = my.wallet
echo default_income_category =
echo default_spending_category =
) > moneytracker.config

(
echo Example #4
echo [TEST: output]
moneytracker config default_income_category = "really big;income"
moneytracker config default_spending_category = "really big;spend"
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
echo default_income_category =
echo default_spending_category =
) > moneytracker.config.expected

(
echo Example #4
echo [TEST: output]
echo error: ';' is not a valid character.
echo error: ';' is not a valid character.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 5 ========================================
(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config

(
echo Example #5
echo [TEST: output]
moneytracker config default_income_category = really big income category
moneytracker config default_spending_category = really big spend category
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config.expected

(
echo Example #5
echo [TEST: output]
echo error: invalid parameters for 'config'.
echo error: invalid parameters for 'config'.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 6 ========================================
(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config

(
echo Example #6
echo [TEST: output]
moneytracker config default_income_category = "really big" "income category"
moneytracker config default_spending_category = "really big" "spend category"
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config.expected

(
echo Example #6
echo [TEST: output]
echo error: invalid parameters for 'config'.
echo error: invalid parameters for 'config'.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 7 ========================================
(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config

(
echo Example #7
echo [TEST: output]
moneytracker config default_income_category = "really big" income category
moneytracker config default_spending_category = "really big" spend category
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config.expected

(
echo Example #7
echo [TEST: output]
echo error: invalid parameters for 'config'.
echo error: invalid parameters for 'config'.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 8 ========================================
(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config

(
echo Example #8
echo [TEST: output]
moneytracker config default_income_category = really big "income category" yes
moneytracker config default_spending_category = really big "spend category" no
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config.expected

(
echo Example #8
echo [TEST: output]
echo error: invalid parameters for 'config'.
echo error: invalid parameters for 'config'.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 9 ========================================
(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config

(
echo Example #9
echo [TEST: output]
moneytracker config default_income_category = really big "income category" yes
moneytracker config default_spending_category = really big "spend category" no
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
echo default_income_category = salary
echo default_spending_category = other
) > moneytracker.config.expected

(
echo Example #9
echo [TEST: output]
echo error: invalid parameters for 'config'.
echo error: invalid parameters for 'config'.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEARDOWN ======================================

rem del moneytracker.config >> %test_name%.actual 2>>&1
rem del moneytracker.config.expected >> %test_name%.actual 2>>&1

rem this should have no output if everything works as expected
rem use diff unified format, and redirect output for later use
diff -u %test_name%.expected %test_name%.actual > %test_name%.diff

if %errorlevel% EQU 1 (
  echo [  FAILED] see %test_name%.diff
) else (
  echo [  PASSED] see %test_name%.diff
)

@echo on
@exit /b
