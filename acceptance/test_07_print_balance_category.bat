@echo off

SET test_name=test_07_print_balance_category

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
echo Example #0
echo [TEST: output]
moneytracker balance -c food
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #0
echo [TEST: output]
echo No transaction with category 'food' is registered in 'my.wallet'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1 
 
rem ============================ TEST 1 ========================================
(
echo +100.00 RON
echo 1445314481;+;111.22;salary;RON
echo 1445314670;-;11.19;food;RON
echo 1445315555;-;127.00;clothes;RON
echo 1445315555;-;127.05;clothes;RON
) > my.wallet

(
echo +100.00 RON
echo 1445314481;+;111.22;salary;RON
echo 1445314670;-;11.19;food;RON
echo 1445315555;-;127.00;clothes;RON
echo 1445315555;-;127.05;clothes;RON
) > my.wallet.expected

(
echo Example #1
echo [TEST: output]
moneytracker balance -c clothes
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #1
echo [TEST: output]
echo Balance for 'clothes' in 'my.wallet' is -254.05 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 2 ========================================
(
echo +100.00 RON
echo 1445314481;+;111.22;salary;RON
echo 1445314670;-;11.19;food;RON
echo 1445315555;+;127.30;food;RON
echo 1445315555;-;127.05;clothes;RON
) > my.wallet

(
echo +100.00 RON
echo 1445314481;+;111.22;salary;RON
echo 1445314670;-;11.19;food;RON
echo 1445315555;+;127.30;food;RON
echo 1445315555;-;127.05;clothes;RON
) > my.wallet.expected

(
echo Example #2
echo [TEST: output]
moneytracker balance --category food -w hello world!
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #2
echo [TEST: output]
echo error: invalid parameters for 'balance'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 3 ========================================
(
echo Example #3
echo [TEST: output]
moneytracker balance -c balance
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #3
echo [TEST: output]
echo No transaction with category 'balance' is registered in 'my.wallet'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 4 ========================================
(
echo Example #4
echo [TEST: output]
moneytracker balance food -c
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
del moneytracker.config >nul 2>&1

(
echo Example #5
echo [TEST: output]
moneytracker balance --category food
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #5
echo [TEST: output]
echo error: could not open configuration 'moneytracker.config'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 6 ========================================
(
echo.
echo
echo default_wallet     =                       
echo some_other=my.wallet
) > moneytracker.config

(
echo Example #6
echo [TEST: output]
moneytracker balance -c somecategory
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #6
echo [TEST: output]
echo error: no default wallet configured in 'moneytracker.config'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEST 7 ========================================
echo default_wallet         =C:\path\some.wallet        > moneytracker.config

(
echo Example #7
echo [TEST: output]
moneytracker balance --category other
echo [TEST: file]
type C:\path\some.wallet
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #7
echo [TEST: output]
echo error: could not open 'C:\path\some.wallet' to calculate balance.
echo [TEST: file]
echo The system cannot find the path specified.
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 8 ========================================
(
echo default_wallet_ =my.wallet                       
echo some_other=value
) > moneytracker.config

(
echo Example #8
echo [TEST: output]
moneytracker balance -c food
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #8
echo [TEST: output]
echo error: no default wallet configured in 'moneytracker.config'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 9 =======================================

(
echo +100.00 RON
echo 1445314481;-;111.00;clothes;RON
echo 1445314670;+;11.00;food;RON
echo 1445315555;-;223.44;clothes;RON
) > my2.wallet

(
echo +100.00 RON
echo 1445314481;-;111.00;clothes;RON
echo 1445314670;+;11.00;food;RON
echo 1445315555;-;223.44;clothes;RON
) > my2.wallet.expected


(
echo.
echo 
echo default_wallet=my2.wallet                       
echo default_wallet = my.wallet                       
echo some_other=value
) > moneytracker.config

(
echo Example #9
echo [TEST: output]
moneytracker balance --category food
echo [TEST: file1]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #9
echo [TEST: output]
echo Balance for 'food' in 'my2.wallet' is +11.00 RON.
echo [TEST: file1]
type my2.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEST 10 =======================================
(
echo Example #10
echo [TEST: output]
moneytracker balance -c --category
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #10
echo [TEST: output]
echo No transaction with category '--category' is registered in 'my2.wallet'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 11 =======================================
(
echo Example #11
echo [TEST: output]
moneytracker balance --category -c
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #11
echo [TEST: output]
echo No transaction with category '-c' is registered in 'my2.wallet'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 12 =======================================
(
echo Example #12
echo [TEST: output]
moneytracker balance -category party
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #12
echo [TEST: output]
echo error: invalid parameters for 'balance'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEARDOWN ======================================
del my.wallet >> %test_name%.actual 2>>&1
del my2.wallet >> %test_name%.actual 2>>&1
del my.wallet.expected >> %test_name%.actual 2>>&1
del my2.wallet.expected >> %test_name%.actual 2>>&1
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