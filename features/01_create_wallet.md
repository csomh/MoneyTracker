Create wallet
=============

One should be able to create a new wallet by calling:
```
> moneytracker create my.wallet 1000
my.wallet created with the initial amount of +1000.00 RON
```

This will create a file named `my.wallet` relative to where the command was
called, with an initial amount of 1000 RON.

Other examples:
```
> moneytracker create other.wallet +200
other.wallet created with the initial amount of +200.00 RON
> moneytracker create yetother -1021.23
yetother created with the initial amount of -1021.23 RON
> moneytracker create yetother -1021.23
error: wallet yetother already exists!
> moneytracker create C:\learn\some.wallet 22
C:\learn\some.wallet created with the initial amount of +22.00 RON
```
