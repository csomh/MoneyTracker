@echo off

SET test_name=test_02_add_income

SET default_inc_cathegory=salary

rem clean log file for actual results
del %test_name%.actual > nul 2>&1
rem clean log file for expected results
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
moneytracker income 200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;200.00;%default_inc_cathegory%;RON" >> my.wallet.expected

(
echo Example #0
echo [TEST: output]
echo Income '%default_inc_cathegory%' in an amount of 200.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 1 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #1
echo [TEST: output]
moneytracker income +123.123
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;123.12;%default_inc_cathegory%;RON" >> my.wallet.expected

(
echo Example #1
echo [TEST: output]
echo Income '%default_inc_cathegory%' in an amount of 123.12 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 2 ========================================
(
echo Example #2
echo [TEST: output]
moneytracker income 0
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #2
echo [TEST: output]
echo error: income should be higher than 0.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 3 ========================================
(
echo Example #3
echo [TEST: output]
moneytracker income tentousand
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #3
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 4 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #4
echo [TEST: output]
moneytracker income +212.00 145 -52 some words
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1


(
echo Example #4
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 5 ========================================
echo default_wallet = C:\path\some.wallet> moneytracker.config

(
echo Example #5
echo [TEST: output]
moneytracker income 1000
echo [TEST: file]
type C:\path\some.wallet
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #5
echo [TEST: output]
echo error: could not open 'C:\path\some.wallet' to register transaction.
echo [TEST: file]
echo The system cannot find the path specified.
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 6 ========================================
del moneytracker.config >nul 2>&1

(
echo Example #6
echo [TEST: output]
moneytracker income 1000
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #6
echo [TEST: output]
echo error: could not open configuration 'moneytracker.config'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 7 ========================================
(
echo.
echo
echo default_wallet = 
echo some_other = value
) > moneytracker.config

(
echo Example #7
echo [TEST: output]
moneytracker income 11.11
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #7
echo [TEST: output]
echo error: no default wallet configured in 'moneytracker.config'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 8 ========================================
(
echo.
echo
echo defualt_wallet = my.wallet
echo some_other = value
) > moneytracker.config

(
echo Example #8
echo [TEST: output]
moneytracker income 111
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
timeout /T 1 /NOBREAK >nul 2>&1
echo +200.00 RON > my2.wallet
echo +200.00 RON > my2.wallet.expected

(
echo.
echo
echo default_wallet = my2.wallet
echo default_wallet = my.wallet
echo some_other = value
) > moneytracker.config

(
echo Example #9
echo [TEST: output]
moneytracker income 111
echo [TEST: file1]
type my2.wallet
echo [TEST: file2]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time ";+;111.00;%default_inc_cathegory%;RON" >> my2.wallet.expected

(
echo Example #9
echo [TEST: output]
echo Income '%default_inc_cathegory%' in an amount of 111.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
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
