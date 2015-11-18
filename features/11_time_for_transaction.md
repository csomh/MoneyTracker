Specify time for transaction
============================

One should be able to specify the time of transactions, using the command option `-t`/`--time`.

```
moneytracker spend -t "18-11-2015 09:15" 20
Spending 'other' in an amount of 20.00 RON was registered.
Transaction time: We, 18 Nov 2015 09:15:00 GMT
```

```
moneytracker income --time '27-11-2015 14:00' 500
Income 'salary' in an amount of 500.00 RON was registered.
Transaction time: Fri, 27 Nov 2015 14:00:00 GMT
```

Value of time is in the format `DD-MM-YYYY HH:MM`.

Leading zeros might be dropped.

If the format above is not respected, or the value is not convertible to a valid time, the following error should be issued, and registering the transaction should be aborted:

```
error: transaction time is not valid
```
