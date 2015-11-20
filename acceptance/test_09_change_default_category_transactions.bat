@echo off

SET test_name=test_09_change_default_category_transactions

rem clean log file for actual results
del %test_name%.actual > nul 2>&1
rem clean log file for expected results
del %test_name%.expected > nul 2>&1

(
echo default_wallet = my.wallet
echo default_income_category =
echo default_spend_category =
) > moneytracker.config

(
echo default_wallet = my.wallet
) > moneytracker.config.expected


rem ============================ TEST 0 ========================================
rem SET location = "big s"
echo on
echo %location%
echo off
(
echo Example #0
echo [TEST: output]
moneytracker config default_income_category = ""big s""
moneytracker config default_spend_category = big
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_income_category = big
echo default_spend_category = big
) >> moneytracker.config.expected

(
echo Example #0
echo [TEST: output]
echo 'big' was configured as default.
echo 'big' was configured as default.
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
