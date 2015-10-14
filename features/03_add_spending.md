Add spending to default wallet file
===================================

One should be able to add a spending to the default wallet file specified in the
configuration file, by calling:

```
> moneytracker spend 145.12
Spending 'other' in an amount of +145.12 RON was registered.
Transaction time: Thu, 14 Oct 2015 10:52:35 GMT
```

If the configuration file `moneytracker.config` has the following content:
```
default_wallet = my.wallet

```

`my.wallet` should be updated as follows, after calling the command above:
```
+1000.00 RON
1444819955;-;145.12;other;RON
```

- The time of the entry is always the current time (epoch timestamp).
- The currency of the entry is always `RON`.
- The category of the entry is always `other`.

`moneytracker.config` is placed next to the application for now, its name does
not change, and it is not moved to another path. (i.e. This is the default
configuration file for the application.)

Examples
--------

Examples for this functionality are analogous to the ones for [adding income](/features/02_add_income.md).
