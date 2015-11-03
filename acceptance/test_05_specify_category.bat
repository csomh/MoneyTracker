@echo off

SET test_name=test_05_specify_category

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

rem ============================ INCOME / -c command ===========================
rem ============================ TEST 0 ========================================
(
echo Example #0
echo [TEST: output]
moneytracker income -c scholarship +200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;200.00;scholarship;RON" >> my.wallet.expected

(
echo Example #0
echo [TEST: output]
echo Income 'scholarship' in an amount of 200.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 1 ========================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #1
echo [TEST: output]
moneytracker income +200 -c scholarship
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;200.00;scholarship;RON" >> my.wallet.expected

(
echo Example #1
echo [TEST: output]
echo Income 'scholarship' in an amount of 200.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 2 ========================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #2
echo [TEST: output]
moneytracker income 200 -c
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #2
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 3 ========================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #3
echo [TEST: output]
moneytracker income --category scholarship +200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;200.00;scholarship;RON" >> my.wallet.expected

(
echo Example #3
echo [TEST: output]
echo Income 'scholarship' in an amount of 200.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 4 ========================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #4
echo [TEST: output]
moneytracker income +200 --category scholarship
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";+;200.00;scholarship;RON" >> my.wallet.expected

(
echo Example #4
echo [TEST: output]
echo Income 'scholarship' in an amount of 200.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 5 ========================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #5
echo [TEST: output]
moneytracker income 200 --category
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #5
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 6 ========================================
(
echo Example #6
echo [TEST: output]
moneytracker income -c 200 scholarship
echo [TEST: output]
moneytracker income scholarship -c 200
echo [TEST: output]
moneytracker income -c 
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #6
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 7 ========================================
(
echo Example #7
echo [TEST: output]
moneytracker income -c 200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #7
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 8 ========================================
(
echo Example #8
echo [TEST: output]
moneytracker income --category 200 scholarship
echo [TEST: output]
moneytracker income scholarship --category 200
echo [TEST: output]
moneytracker income --category 
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #8
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 9 ========================================
(
echo Example #9
echo [TEST: output]
moneytracker income --category 200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #9
echo [TEST: output]
echo error: invalid parameters for 'income'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1


rem ============================ SPEND / -c command ===========================
rem ============================ TEST 10 =======================================
(
echo Example #10
echo [TEST: output]
moneytracker spend -c scholarship +200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;200.00;scholarship;RON" >> my.wallet.expected

(
echo Example #10
echo [TEST: output]
echo Spending 'scholarship' in an amount of 200.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 11 =======================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #11
echo [TEST: output]
moneytracker spend +200 -c scholarship
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;200.00;scholarship;RON" >> my.wallet.expected

(
echo Example #11
echo [TEST: output]
echo Spending 'scholarship' in an amount of 200.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 12 =======================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #12
echo [TEST: output]
moneytracker spend 200 -c
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #12
echo [TEST: output]
echo error: invalid parameters for 'spend'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 13 =======================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #13
echo [TEST: output]
moneytracker spend --category scholarship +200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;200.00;scholarship;RON" >> my.wallet.expected

(
echo Example #13
echo [TEST: output]
echo Spending 'scholarship' in an amount of 200.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 14 =======================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #14
echo [TEST: output]
moneytracker spend +200 --category scholarship
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

test_time.exe ";-;200.00;scholarship;RON" >> my.wallet.expected

(
echo Example #14
echo [TEST: output]
echo Spending 'scholarship' in an amount of 200.00 RON was registered to 'my.wallet'.
test_time.exe --gmt
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 15 =======================================
timeout /T 2 /NOBREAK >nul 2>&1

(
echo Example #15
echo [TEST: output]
moneytracker spend 200 --category
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #15
echo [TEST: output]
echo error: invalid parameters for 'spend'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 16 =======================================
(
echo Example #16
echo [TEST: output]
moneytracker spend -c 200 scholarship
echo [TEST: output]
moneytracker spend scholarship -c 200
echo [TEST: output]
moneytracker spend -c 
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #16
echo [TEST: output]
echo error: invalid parameters for 'spend'.
echo [TEST: output]
echo error: invalid parameters for 'spend'.
echo [TEST: output]
echo error: invalid parameters for 'spend'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 17 =======================================
(
echo Example #17
echo [TEST: output]
moneytracker spend -c 200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #17
echo [TEST: output]
echo error: invalid parameters for 'spend'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 18 =======================================
(
echo Example #18
echo [TEST: output]
moneytracker spend --category 200 scholarship
echo [TEST: output]
moneytracker spend scholarship --category 200
echo [TEST: output]
moneytracker spend --category 
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #18
echo [TEST: output]
echo error: invalid parameters for 'spend'.
echo [TEST: output]
echo error: invalid parameters for 'spend'.
echo [TEST: output]
echo error: invalid parameters for 'spend'.
echo [TEST: file]
type my.wallet.expected
echo ... end ...
echo.
) >> %test_name%.expected 2>>&1

rem ============================ TEST 19 =======================================
(
echo Example #19
echo [TEST: output]
moneytracker spend --category 200
echo [TEST: file]
type my.wallet
echo ... end ...
echo.
) >> %test_name%.actual 2>>&1

(
echo Example #19
echo [TEST: output]
echo error: invalid parameters for 'spend'.
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