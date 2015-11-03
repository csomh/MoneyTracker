@echo off

SET test_name=test_06_specify_wallet_trans

rem clean log file for actual results
del %test_name%.actual > nul 2>&1
rem clean log file for actual results
del %test_name%.expected > nul 2>&1

(
echo default_wallet = my.wallet
) > moneytracker.config

(
echo +100.00 RON
) > my.wallet

(
echo +100.00 RON
) > my2.wallet

(
echo +100.00 RON
) > my3.wallet

(
 echo +100.00 RON
) > my.wallet.expected

rem ============================ TEST 0 ========================================
(
echo Example #0
echo [TEST: output]
moneytracker income 246
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;246.00;salary;RON" >> my.wallet.expected

(
echo Example #0
echo [TEST: output]
echo Income 'salary' in an amount of 246.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================  VALID  =======================================
rem ============================  '-w'  ========================================
rem ============================ TEST 1 ========================================

moneytracker income -w my2.wallet 246 >nul
timeout /T 1 /NOBREAK >nul 2>&1
(
echo Example #1
echo [TEST: output]
moneytracker income -w my2.wallet +200.00
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;200.00;salary;RON" >> my.wallet.expected

(
echo Example #1
echo [TEST: output]
echo Income 'salary' in an amount of 200.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 2 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #2
echo [TEST: output]
moneytracker spend 200.00 -w my2.wallet
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;200.00;other;RON" >> my.wallet.expected

(
echo Example #2
echo [TEST: output]
echo Spending 'other' in an amount of 200.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 3 ========================================
timeout /T 1 /NOBREAK >nul 2>&1
(
echo Example #3
echo [TEST: output]
moneytracker income -c lottery -w my2.wallet +2000.0
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;2000.00;lottery;RON" >> my.wallet.expected

(
echo Example #3
echo [TEST: output]
echo Income 'lottery' in an amount of 2000.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
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
moneytracker spend -c bonus 200 -w my2.wallet
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;200.00;bonus;RON" >> my.wallet.expected

(
echo Example #4
echo [TEST: output]
echo Spending 'bonus' in an amount of 200.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1
rem ============================ TEST 5 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #5
echo [TEST: output]
moneytracker income 999.889 --category bonus -w my2.wallet
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;999.89;bonus;RON" >> my.wallet.expected

(
echo Example #5
echo [TEST: output]
echo Income 'bonus' in an amount of 999.89 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 6 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #6
echo [TEST: output]
moneytracker spend 002.889 -w my2.wallet -c bonus 
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;2.89;bonus;RON" >> my.wallet.expected

(
echo Example #6
echo [TEST: output]
echo Spending 'bonus' in an amount of 2.89 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 7 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #7
echo [TEST: output]
moneytracker income -w my2.wallet --category bonus 000.889
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;0.89;bonus;RON" >> my.wallet.expected

(
echo Example #7
echo [TEST: output]
echo Income 'bonus' in an amount of 0.89 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 8 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #8
echo [TEST: output]
moneytracker income -w my2.wallet 111 --category bonus
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;111.00;bonus;RON" >> my.wallet.expected

(
echo Example #8
echo [TEST: output]
echo Income 'bonus' in an amount of 111.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 9 =======================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #9
echo [TEST: output]
moneytracker spend 123 -c -w
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;123.00;-w;RON" >> my.wallet.expected

(
echo Example #9
echo [TEST: output]
echo Spending '-w' in an amount of 123.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

moneytracker spend -w my2.wallet 123 -c -w >nul
timeout /T 1 /NOBREAK >nul 2>&1

rem =========================  '--wallet' ======================================
rem ============================ TEST 10 =======================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #10
echo [TEST: output]
moneytracker spend --wallet my2.wallet +200.00
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;200.00;other;RON" >> my.wallet.expected

(
echo Example #10
echo [TEST: output]
echo Spending 'other' in an amount of 200.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 11 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #11
echo [TEST: output]
moneytracker income 200.00 --wallet my2.wallet
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;200.00;salary;RON" >> my.wallet.expected

(
echo Example #11
echo [TEST: output]
echo Income 'salary' in an amount of 200.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 12 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #12
echo [TEST: output]
moneytracker income --category lottery --wallet my2.wallet +2000.0
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;2000.00;lottery;RON" >> my.wallet.expected

(
echo Example #12
echo [TEST: output]
echo Income 'lottery' in an amount of 2000.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 13 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #13
echo [TEST: output]
moneytracker spend -c bonus 200 --wallet my2.wallet
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;200.00;bonus;RON" >> my.wallet.expected

(
echo Example #13
echo [TEST: output]
echo Spending 'bonus' in an amount of 200.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1
rem ============================ TEST 14 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #14
echo [TEST: output]
moneytracker income 999.889 -c bonus --wallet my2.wallet
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;999.89;bonus;RON" >> my.wallet.expected

(
echo Example #14
echo [TEST: output]
echo Income 'bonus' in an amount of 999.89 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 15 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #15
echo [TEST: output]
moneytracker spend 002.889 --wallet my2.wallet --category bonus 
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;2.89;bonus;RON" >> my.wallet.expected

(
echo Example #15
echo [TEST: output]
echo Spending 'bonus' in an amount of 2.89 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 16 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #16
echo [TEST: output]
moneytracker spend --wallet my2.wallet -c bonus 000.889
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;0.89;bonus;RON" >> my.wallet.expected

(
echo Example #16
echo [TEST: output]
echo Spending 'bonus' in an amount of 0.89 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 17 ========================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #17
echo [TEST: output]
moneytracker income --wallet my2.wallet 111 --category bonus
echo [TEST: file]
type my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;111.00;bonus;RON" >> my.wallet.expected

(
echo Example #17
echo [TEST: output]
echo Income 'bonus' in an amount of 111.00 RON was registered to 'my2.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 18 =======================================
timeout /T 1 /NOBREAK >nul 2>&1

(
echo Example #18
echo [TEST: output]
moneytracker income 123 -c --wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;123.00;-w;RON" >> my.wallet.expected

(
echo Example #18
echo [TEST: output]
echo Income '--wallet' in an amount of 123.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

moneytracker spend -w my2.wallet 123 -c -w >nul
timeout /T 1 /NOBREAK >nul 2>&1

rem ============================  INVALID  =====================================
rem =============================  '-w'  =======================================
rem ============================ TEST 19 =======================================
(
echo Example #19
echo [TEST: output]
moneytracker -w my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #19
echo [TEST: output]
echo error: invalid command !
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1



rem ============================ TEST 20 =======================================
(
echo Example #20
echo [TEST: output]
moneytracker create -w my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #20
echo [TEST: output]
echo error: 'my.wallet' is not a valid initial amount.
echo Creating '-w' aborted.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 21 =======================================
(
echo Example #21
echo [TEST: output]
moneytracker income 200 -c bonus -w my.wallet2
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #21
echo [TEST: output]
echo error: could not open 'my.wallet2' to register transaction.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 22 =======================================
(
echo Example #22
echo [TEST: output]
moneytracker spend 200 -w --wallet --category bonus
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #22
echo [TEST: output]
echo error: could not open '--wallet' to register transaction.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 23 =======================================
(
echo Example #23
echo [TEST: output]
moneytracker income -w 200 my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #23
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 24 =======================================
(
echo Example #24
echo [TEST: output]
moneytracker spend -c party -w my3.wallet -200
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #24
echo [TEST: output]
echo error: spending should be higher than 0.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem =========================  '--wallet' ======================================
rem ============================ TEST 25 =======================================
(
echo Example #25
echo [TEST: output]
moneytracker --wallet my2.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #25
echo [TEST: output]
echo error: invalid command !
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1
rem ============================ TEST 26 =======================================
(
echo Example #26
echo [TEST: output]
moneytracker create --wallet my4.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #26
echo [TEST: output]
echo error: 'my4.wallet' is not a valid initial amount.
echo Creating '--wallet' aborted.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 27 =======================================
(
echo Example #27
echo [TEST: output]
moneytracker income 200 --category bonus --wallet my.wallet2
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #27
echo [TEST: output]
echo error: could not open 'my.wallet2' to register transaction.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 28 =======================================
(
echo Example #28
echo [TEST: output]
moneytracker income 200 --wallet --wallet -c bonus
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #28
echo [TEST: output]
echo error: could not open '--wallet' to register transaction.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 29 =======================================
(
echo Example #29
echo [TEST: output]
moneytracker income --wallet 200 my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #29
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 30 =======================================
(
echo Example #30
echo [TEST: output]
moneytracker income --category party --wallet my3.wallet -200
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #30
echo [TEST: output]
echo error: income should be higher than 0.
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEARDOWN ======================================
del my.wallet >> %test_name%.actual 2>>&1
del my2.wallet >> %test_name%.actual 2>>&1
del my3.wallet >> %test_name%.actual 2>>&1
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