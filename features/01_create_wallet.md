Create wallet
=============

One should be able to create a new wallet by calling:
```
> moneytracker create my.wallet 1000
my.wallet created with the initial amount of +1000.00 RON
```

This will create a file named `my.wallet` relative to where the command was
called, with an initial amount of 1000 RON.
```
+1000.00 RON

```

This command should not touch the configuration file (setting the default
wallet is a separate command).

Examples:
---------------
Create wallet using + sign:
```
> moneytracker create other.wallet +200
other.wallet created with the initial amount of +200.00 RON
```

Create wallet with debt and two decimals:
```
> moneytracker create yetother -1021.23
yetother created with the initial amount of -1021.23 RON
```

Trying to create a wallet which already exists:
```
> moneytracker create yetother not_number
error: wallet yetother already exists!
```

Creating wallet with absoulute path and more than two decimals
```
> moneytracker create C:\learn\some.wallet 22.125
C:\learn\some.wallet created with the initial amount of +22.13 RON
```

Create wallet with no initial amount:
```
> moneytracker create noinitial.wallet
noinitial.wallet created with the initial amount of +00.00 RON
```

Creating wallet with incorrect decimal separator:
```
> moneytracker create wrongdec.wallet 12,24
error: 12,24 is not a valid initial ammount.
Creating wrongdec.wallet aborted.
```

Creating wallet using initial value with leading zeros (should not work):
```
> moneytracker create leading0.wallet -00012.24
error: -00012.24 is not a valid initial ammount.
Creating leading0.wallet aborted.
```
