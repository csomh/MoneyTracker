@echo off

SET test_name=test_08_change_default_wallet

rem clean log file for actual results
del %test_name%.actual > nul 2>&1
rem clean log file for actual results
del %test_name%.expected > nul 2>&1

(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo default_wallet = my.wallet
) > moneytracker.config.expected


rem ============================ TEST 0 ========================================
(
 echo Example #0
echo [TEST: output]
moneytracker config default_wallet=asaceva.wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = asaceva.wallet
) > moneytracker.config.expected

(
echo Example #0
echo [TEST: output]
echo 'asaceva.wallet' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEST 1 ========================================
(
echo Example #1
echo [TEST: output]
moneytracker config default_wallet   =    asaaltceva.wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = asaaltceva.wallet
) > moneytracker.config.expected

(
echo Example #1
echo [TEST: output]
echo 'asaaltceva.wallet' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 2 ========================================
(
echo default_wallet = default_wallet
) > moneytracker.config

(
 echo Example #2
echo [TEST: output]
moneytracker config default_wallet =   default_wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = default_wallet
) > moneytracker.config.expected

(
echo Example #2
echo [TEST: output]
echo 'default_wallet' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 3 ========================================
(
echo default_wallet =
) > moneytracker.config

(
echo Example #3
echo [TEST: output]
moneytracker config default_wallet=    test.wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = test.wallet
) > moneytracker.config.expected

(
echo Example #3
echo [TEST: output]
echo 'test.wallet' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

REM rem ============================ TEST 4 ========================================
REM (
REM echo  
REM ) > moneytracker.config

REM (
REM echo Example #4
REM echo [TEST: output]
REM moneytracker config default_wallet		=  other.wallet			
REM echo [TEST: file]
REM type moneytracker.config
REM echo ... end ...
REM echo.
REM ) >> %test_name%.actual 2>>&1

REM (
REM echo default_wallet = other.wallet
REM ) > moneytracker.config.expected

REM (
REM echo Example #4
REM echo [TEST: output]
REM echo 'other.wallet' was configured as default.
REM echo [TEST: file]
REM type moneytracker.config.expected
REM echo ... end ...
REM echo.
REM ) >> %test_name%.expected 2>>&1


rem ============================ TEST 5 ========================================
(
echo default_wallet =  text.wallet 
) > moneytracker.config

(
echo Example #5
echo [TEST: output]
moneytracker config default_wallet    =  any_other_wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = any_other_wallet
) > moneytracker.config.expected

(
echo Example #5
echo [TEST: output]
echo 'any_other_wallet' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEST 6 ========================================

(
echo default_wallet = text.wallet
) > moneytracker.config


(
echo Example #6
echo [TEST: output]
moneytracker config default_wallet_	=  any_other_wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = text.wallet
) > moneytracker.config.expected

(
echo Example #6
echo [TEST: output]
echo 'default_wallet_' is not a valid configuration value.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 7 ========================================
(
echo default_wallet = my.wallet
echo default_currency = RON
echo default_income_category = salary
echo default_spending_category = other
echo currencies = RON, EUR, USD
echo rate_EUR_RON = 4.42
echo rate_RON_EUR = 0.23
echo rate_USD_RON = 3.92
echo rate_EUR_USD = 1.13
) > moneytracker.config

(
echo Example #7
echo [TEST: output]
moneytracker config			
echo [TEST: file]
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #7
echo [TEST: output]
echo default_wallet = my.wallet
echo default_currency = RON
echo default_income_category = salary
echo default_spending_category = other
echo currencies = RON, EUR, USD
echo rate_EUR_RON = 4.42
echo rate_RON_EUR = 0.23
echo rate_USD_RON = 3.92
echo rate_EUR_USD = 1.13
echo [TEST: file]
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 8 ========================================
(
echo default_wallet = 
) > moneytracker.config

(
echo Example #8
echo [TEST: output]
moneytracker config		
echo [TEST: file]
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #8
echo [TEST: output]
echo default_wallet = 
echo [TEST: file]
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 9 ========================================
(
echo nothing
) > moneytracker.config

(
echo Example #9
echo [TEST: output]
moneytracker config		
echo [TEST: file]
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #9
echo [TEST: output]
echo nothing
echo [TEST: file]
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 10 ========================================
(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo Example #10
echo [TEST: output]
moneytracker config default_wallet=   test.wallet  _something		
echo [TEST: file]
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = test.wallet
) > moneytracker.config.expected

(
echo Example #10
echo [TEST: output]
echo error: invalid parameters for 'config'.
echo [TEST: file]
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEST 11 ========================================
(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo Example #11
echo [TEST: output]
moneytracker config default_wallet=  C:\other.wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = C:\other.wallet
) > moneytracker.config.expected

(
echo Example #11
echo [TEST: output]
echo 'C:\other.wallet' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEST 12 ========================================
(
echo default_wallet = my.wallet
echo default_wallet = other.wallet
echo default_wallet = else.wallet
) > moneytracker.config

(
echo Example #12
echo [TEST: output]
moneytracker config   default_wallet  =  test.wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = test.wallet
echo default_wallet = other.wallet
echo default_wallet = else.wallet
) > moneytracker.config.expected

(
echo Example #12
echo [TEST: output]
echo 'test.wallet' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


REM rem ============================ TEST 13 ========================================
REM (
REM echo default_currency = RON
REM echo default_income_category = salary
REM echo default_spending_category = other
REM ) > moneytracker.config

REM (
REM echo Example #13
REM echo [TEST: output]
REM moneytracker config default_wallet=   first.wallet			
REM echo [TEST: file]
REM type moneytracker.config
REM echo ... end ...
REM echo.
REM ) >> %test_name%.actual 2>>&1

REM (
REM echo default_wallet = first.wallet
REM echo default_currency = RON
REM echo default_income_category = salary
REM echo default_spending_category = other
REM ) > moneytracker.config.expected

REM (
REM echo Example #13
REM echo [TEST: output]
REM echo 'first.wallet' was configured as default.
REM echo [TEST: file]
REM type moneytracker.config.expected
REM echo ... end ...
REM echo.
REM ) >> %test_name%.expected 2>>&1


rem ============================ TEST 14 ========================================
(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo Example #14
echo [TEST: output]
moneytracker config default_wallet==new.wallet  
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = =new.wallet
) > moneytracker.config.expected

(
echo Example #14
echo [TEST: output]
echo '=new.wallet' was configured as default.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1



rem ============================ TEST 15 ========================================
(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo Example #15
echo [TEST: output]
moneytracker config default_wallet == new.wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
) > moneytracker.config.expected

(
echo Example #15
echo [TEST: output]
echo error: invalid parameters for 'config'.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEST 16 ========================================
(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo Example #16
echo [TEST: output]
moneytracker config default_wallet = = new.wallet
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
) > moneytracker.config.expected

(
echo Example #16
echo [TEST: output]
echo error: invalid parameters for 'config'.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEST 17 ========================================
(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo Example #17
echo [TEST: output]
moneytracker config some_wal = garbage
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
) > moneytracker.config.expected

(
echo Example #17
echo [TEST: output]
echo 'some_wal' is not a valid configuration value.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 18 ========================================
(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo Example #18
echo [TEST: output]
moneytracker config default_wallet=	   
echo [TEST: file]
type moneytracker.config
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo default_wallet = my.wallet
) > moneytracker.config.expected

(
echo Example #18
echo [TEST: output]
echo error: invalid parameters for 'config'.
echo [TEST: file]
type moneytracker.config.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEARDOWN ======================================

del moneytracker.config >> %test_name%.actual 2>>&1
del moneytracker.config.expected >> %test_name%.actual 2>>&1

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