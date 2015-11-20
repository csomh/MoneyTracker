@echo off

SET test_name=test_04_print_balance

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
moneytracker balance
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #0
echo [TEST: output]
echo Balance for 'my.wallet' is +1000.00 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 1 ========================================
(
echo +00.00 RON
) > my.wallet
(
 echo +00.00 RON
) > my.wallet.expected
(
echo Example #1
echo [TEST: output]
moneytracker balance
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #1
echo [TEST: output]
echo Balance for 'my.wallet' is +0.00 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 2 ========================================
(
echo -1000.00 RON
) > my.wallet
(
 echo -1000.00 RON
) > my.wallet.expected
(
echo Example #2
echo [TEST: output]
moneytracker balance
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #2
echo [TEST: output]
echo Balance for 'my.wallet' is -1000.00 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 3 ========================================
(
echo +100.00 RON
echo 1445314481;+;111.22;salary;RON
echo 1445314670;-;11.19;food;RON
echo 1445315555;-;127.00;clothes;RON
) > my.wallet

(
echo +100.00 RON
echo 1445314481;+;111.22;salary;RON
echo 1445314670;-;11.19;food;RON
echo 1445315555;-;127.00;clothes;RON
) > my.wallet.expected

(
echo Example #3
echo [TEST: output]
moneytracker balance
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #3
echo [TEST: output]
echo Balance for 'my.wallet' is +73.03 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 4 ========================================
(
echo +100.00 RON
echo 1445314481;+;111.00;salary;RON
echo 1445314670;-;11.00;food;RON
echo 1445315555;-;200.00;clothes;RON
) > my.wallet

(
echo +100.00 RON
echo 1445314481;+;111.00;salary;RON
echo 1445314670;-;11.00;food;RON
echo 1445315555;-;200.00;clothes;RON
) > my.wallet.expected

(
echo Example #4
echo [TEST: output]
moneytracker balance
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #4
echo [TEST: output]
echo Balance for 'my.wallet' is +0.00 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 5 ========================================
(
echo +100.00 RON
echo 1445314481;-;111.00;clothes;RON
echo 1445314670;+;11.00;food;RON
echo 1445315555;-;223.44;clothes;RON
) > my.wallet

(
echo +100.00 RON
echo 1445314481;-;111.00;clothes;RON
echo 1445314670;+;11.00;food;RON
echo 1445315555;-;223.44;clothes;RON
) > my.wallet.expected

(
echo Example #5
echo [TEST: output]
moneytracker balance
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #5
echo [TEST: output]
echo Balance for 'my.wallet' is -223.44 RON.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 6 ========================================

(
echo Example #6
echo [TEST: output]
moneytracker balance some words added 100
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
del moneytracker.config >nul 2>&1

(
echo Example #7
echo [TEST: output]
moneytracker balance
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #7
echo [TEST: output]
echo error: could not open configuration 'moneytracker.config'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 8 ========================================
(
echo.
echo 
echo default_wallet = 
echo some_other = value
) > moneytracker.config

(
echo Example #8
echo [TEST: output]
moneytracker balance
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

rem ============================ TEST 9 ========================================
echo default_wallet = C:\path\some.wallet> moneytracker.config

(
echo Example #9
echo [TEST: output]
moneytracker balance
echo [TEST: file]
type C:\path\some.wallet
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #9
echo [TEST: output]
echo error: could not open 'C:\path\some.wallet' to calculate balance.
echo [TEST: file]
echo The system cannot find the path specified.
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 10 ========================================
(
echo.
echo 
echo defualt_wallet = my.wallet
echo some_other = value
) > moneytracker.config

(
echo Example #10
echo [TEST: output]
moneytracker balance
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #10
echo [TEST: output]
echo error: no default wallet configured in 'moneytracker.config'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 11 ========================================
timeout /T 2 /NOBREAK >nul 2>&1
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
echo default_wallet = my2.wallet
echo default_wallet = my.wallet
echo some_other = value
) > moneytracker.config

(
echo Example #11
echo [TEST: output]
moneytracker balance
echo [TEST: file1]
type my2.wallet
echo [TEST: file2]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #11
echo [TEST: output]
echo Balance for 'my2.wallet' is -223.44 RON.
echo [TEST: file1]
type my2.wallet.expected
echo [TEST: file2]
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