Specify wallet for transaction
==============================

One should be able to specify the wallet where a transaction should be
registered, by calling:

```
> moneytracker income -c salary -w my.wallet +200.00
Income 'salary' in an amount of 200.00 RON was registered to 'my.wallet'.
Transaction time: Thu, 08 Oct 2015 10:52:35 GMT
> moneytracker spend 10 --wallet C:\learn\my.wallet --category food
Spending 'food' in an amount of 10.00 RON was registered to 'C:\learn\my.wallet'
Transaction time: Thu, 14 Oct 2015 10:52:35 GMT
```

