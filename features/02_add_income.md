Add income to the wallet file
=============================

One should be able to add an income to the wallet file specified in the
configuration file, by calling
```
> moneytracker income 200
Income 'salary' in an amount of 200.00 RON was registered.
Transaction time: Thu, 08 Oct 2015 10:52:35 GMT
```

If the configuration file `moneytracker.config` has the following content:
```
default_wallet = my.wallet

```

`my.wallet` should be updated as follows, after calling the command above:
```
+1000.00 RON
1444301555;+;200.00;salary;RON
```

- The time of the entry is always the current time (epoch timestamp).
- The currency of the entry is always `RON`.
- The category of the entry is always `salary`.

`moneytracker.config` is placed next to the application for now, its name does
not change, and it is not moved to another path. (i.e. This is the default
configuration file for the application.)

Examples
--------

Add income with + sign and more than 2 digits:
```
> moneytracker income +123.123
Income 'salary' in an amount of 123.12 RON was registered.
Transaction time: Thu, 08 Oct 2015 10:52:40 GMT
```
`my.wallet` is updated:
```
+1000.00 RON
1444301555;+;200.00;salary;RON
1444301560;+;123.12;salary;RON
```

---

Only positive numbers are accepted:
```
> moneytracker income 0
error: income should be higher than 0.
> moneytracker income -0.01
error: income should be higher than 0.
```

`my.wallet` is not changed.

---

Only numbers should be accepted:
```
> moneytracker income tentousand
error: parameter for 'income' should be a positive number
```

`my.wallet` is not changed.

---

`income` should have a parameter:
```
> moneytracker income
error: no ammount specified for 'income'.
```

`my.wallet` is not changed.

---

Parameters after ammount are ignored:
```
> moneytracker income +212.00 145 -52 some words
Income 'salary' in an amount of 212.00 RON was registered.
Transaction time: Thu, 08 Oct 2015 10:52:45 GMT
```

`my.wallet` is updated:
```
+1000.00 RON
1444301555;+;200.00;salary;RON
1444301560;+;123.12;salary;RON
1444301565;+;212.00;salary;RON
```

---

Error if opening of wallet failed (for any reason):
```
> moneytracker income 1000
error: could not open 'C:\path\some.wallet' to register transaction
```

If `default_wallet = C:\path\some.wallet`.

---

Error if opening of configuration file failed (for any reason)
```
> moneytracker income 1000
error: could not open configuration 'moneytracker.config'
```

### Content of configuration file

There should be a line `default_wallet = file.name` in the configuration file.
Whitespace characters should not be considered arround the `=` and at the end of the 
line.
Whitespace at the beginning of line should be ignored.
Whitespace in path should not be considered right now.

```
default_wallet=my.wallet     
default_wallet    =             my.wallet
                    default_wallet=      my.wallet
```

### Multiple `default_wallet` variables in the config file

First should be considered, i.e. reading of config file can be stopped after finding
the first var.

### Error in case var `default_wallet` is not found in the config file

```
error: no default wallet configured in 'moneytracker.config'
```
