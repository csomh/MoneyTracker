Add income to the wallet file
=============================

One should be able to add an income to the wallet file specified in the
configuration file, by calling
```
> moneytracker income 200
Income 'salary' in an amount of +200.00 RON was registered.
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

Examples
--------

Add income with + sign and more than 2 digits:
```
> moneytracker income +123.123
Income 'salary' in an amount of +123.12 RON was registered.
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
Income 'salary' in an amount of +212.00 RON was registered.
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
error: could not open 'some.wallet' to register transaction
```
