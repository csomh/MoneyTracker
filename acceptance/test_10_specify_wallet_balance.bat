@echo off

SET test_name=test_10_specify_wallet_balance

rem clean log file for actual results
del %test_name%.actual > nul 2>&1
rem clean log file for actual results
del %test_name%.expected > nul 2>&1

(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo +1000.00 RON
) > my.wallet

(
 echo +1000.00 RON
) > my.wallet.expected


rem ============================ TEST 0 ========================================
(
echo +100.00 RON
echo 1445314481;+;111.22;salary;RON
echo 1445314670;-;11.19;food;RON
echo 1445315555;-;120.00;mere si caise;RON
echo 1445315555;-;120.20;mere si caise;RON
) > my.wallet

(
echo +100.00 RON
echo 1445314481;+;111.22;salary;RON
echo 1445314670;-;11.19;food;RON
echo 1445315555;-;120.00;mere si caise;RON
echo 1445315555;-;120.20;mere si caise;RON
) > my.wallet.expected

(
echo Example #0
echo [TEST: output]
moneytracker balance -w my.wallet -c "mere si caise"
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #0
echo [TEST: output]
echo Balance for 'mere si caise' in 'my.wallet' is -240.20 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 1 ========================================
(
echo Example #1
echo [TEST: output]
moneytracker balance --wallet my.wallet --category salary
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #1
echo [TEST: output]
echo Balance for 'salary' in 'my.wallet' is +111.22 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 2 ========================================
(
echo Example #2
echo [TEST: output]
moneytracker balance --category food -w my.wallet
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #2
echo [TEST: output]
echo Balance for 'food' in 'my.wallet' is -11.19 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 3 ========================================

(
echo Example #3
echo [TEST: output]
moneytracker balance -w my.wallet
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #3
echo [TEST: output]
echo Balance for 'my.wallet' is -40.17 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 4 ========================================

(
echo Example #4
echo [TEST: output]
moneytracker balance -w
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #4
echo [TEST: output]
echo error: invalid parameters for 'balance'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 5 ========================================

(
echo Example #5
echo [TEST: output]
moneytracker balance -w my.wallet.nu.exista
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #5
echo [TEST: output]
echo error: could not open 'my.wallet.nu.exista' to calculate balance.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 6 ========================================

(
echo Example #6
echo [TEST: output]
moneytracker balance -w my.wallet aa
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #6
echo [TEST: output]
echo error: invalid parameters for 'balance'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 7 ========================================

(
echo Example #7
echo [TEST: output]
moneytracker balance -w my.wallet -c mere aa bb
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #7
echo [TEST: output]
echo error: invalid parameters for 'balance'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 8 ========================================

(
echo Example #8
echo [TEST: output]
moneytracker balance aa bb -w my.wallet -c mere
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #8
echo [TEST: output]
echo error: invalid parameters for 'balance'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 9 ========================================

(
echo Example #9
echo [TEST: output]
moneytracker balance -w my.wallet aa -c mere 
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #9
echo [TEST: output]
echo error: invalid parameters for 'balance'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 10 =======================================

(
echo Example #10
echo [TEST: output]
moneytracker balance -w my.wallet -c prune 
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #10
echo [TEST: output]
echo No transaction with category 'prune' is registered in 'my.wallet'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 11 =======================================

(
echo Example #11
echo [TEST: output]
moneytracker balance -w my.wallet.nu.exista -c prune 
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #11
echo [TEST: output]
echo error: could not open 'my.wallet.nu.exista' to calculate balance.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 12 =======================================

(
echo Example #12
echo [TEST: output]
moneytracker balance -c prune -w my.wallet.nu.exista
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #12
echo [TEST: output]
echo error: could not open 'my.wallet.nu.exista' to calculate balance.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 13 =======================================

(
echo Example #13
echo [TEST: output]
moneytracker balance -c prune -w ""
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #13
echo [TEST: output]
echo error: could not open '' to calculate balance.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 14 =======================================

(
echo Example #14
echo [TEST: output]
moneytracker balance -w "  "
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #14
echo [TEST: output]
echo error: could not open '  ' to calculate balance.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 15 =======================================

(
echo Example #15
echo [TEST: output]
moneytracker balance -c "  " -w my.wallet
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #15
echo [TEST: output]
echo No transaction with category '  ' is registered in 'my.wallet'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEARDOWN ======================================
del my.wallet >> %test_name%.actual 2>>&1
del my.wallet.expected >> %test_name%.actual 2>>&1
del moneytracker.config >> %test_name%.actual 2>>&1

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
