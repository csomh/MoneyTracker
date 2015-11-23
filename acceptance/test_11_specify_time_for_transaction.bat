@echo off

SET test_name=test_11_specify_time_for_transaction

rem clean log file for actual results
del %test_name%.actual > nul 2>&1
rem clean log file for expected results
del %test_name%.expected > nul 2>&1


(
 echo default_wallet = my.wallet
) > moneytracker.config

rem ============================ TEST 0 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #0
echo [TEST: output]
moneytracker spend -t "18-11-2015 09:15" 200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

echo 1447838100;-;200.00;other;RON>> my.wallet.expected

(
echo Example #0
echo [TEST: output]
echo Spending 'other' in an amount of 200.00 RON was registered to 'my.wallet'.
echo Transaction time: Wed, 18 Nov 2015 09:15:00 GMT
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ TEST 1 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #1
echo [TEST: output]
moneytracker spend --time "18-11-2015 09:15" 200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

echo 1447838100;-;200.00;other;RON>> my.wallet.expected

(
echo Example #1
echo [TEST: output]
echo Spending 'other' in an amount of 200.00 RON was registered to 'my.wallet'.
echo Transaction time: Wed, 18 Nov 2015 09:15:00 GMT
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 2 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #2
echo [TEST: output]
moneytracker income 500 --time "18-11-2015 09:15"
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

echo 1447838100;+;500.00;salary;RON>> my.wallet.expected

(
echo Example #2
echo [TEST: output]
echo Income 'salary' in an amount of 500.00 RON was registered to 'my.wallet'.
echo Transaction time: Wed, 18 Nov 2015 09:15:00 GMT
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 3 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #3
echo [TEST: output]
moneytracker income 500 -t "18-11-2015 09:15"
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

echo 1447838100;+;500.00;salary;RON>> my.wallet.expected

(
echo Example #3
echo [TEST: output]
echo Income 'salary' in an amount of 500.00 RON was registered to 'my.wallet'.
echo Transaction time: Wed, 18 Nov 2015 09:15:00 GMT
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 4 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #4
echo [TEST: output]
moneytracker spend   -t     "18-11-2015 09:15"   +500
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

echo 1447838100;-;500.00;other;RON>> my.wallet.expected

(
echo Example #4
echo [TEST: output]
echo Spending 'other' in an amount of 500.00 RON was registered to 'my.wallet'.
echo Transaction time: Wed, 18 Nov 2015 09:15:00 GMT
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 5 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #5
echo [TEST: output]
moneytracker        spend          500          --time       "18-11-2015 09:15" 
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

echo 1447838100;-;500.00;other;RON>> my.wallet.expected

(
echo Example #5
echo [TEST: output]
echo Spending 'other' in an amount of 500.00 RON was registered to 'my.wallet'.
echo Transaction time: Wed, 18 Nov 2015 09:15:00 GMT
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1







rem ============================ TEST 6 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #6
echo [TEST: output]
moneytracker income 500 -t "38-11-2015 09:15"
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #6
echo [TEST: output]
echo error: transaction time is not valid.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 7 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #7
echo [TEST: output]
moneytracker income 500 -t "28-11-2015 26:15"
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #7
echo [TEST: output]
echo error: transaction time is not valid.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 8 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #8
echo [TEST: output]
moneytracker income 500 -t "0028-11-2015 22:15"
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #8
echo [TEST: output]
echo error: transaction time is not valid.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 9 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #9
echo [TEST: output]
moneytracker income 500 --time "26:15 28-11-2015"
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #9
echo [TEST: output]
echo error: transaction time is not valid.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 10 =======================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my.wallet.expected

(
echo Example #10
echo [TEST: output]
moneytracker spend     --time "28-11-201526:15"    +500
echo [TEST: file]
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #10
echo [TEST: output]
echo error: transaction time is not valid.
echo [TEST: file]
type my.wallet.expected
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
