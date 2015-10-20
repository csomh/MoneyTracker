Print balance for default wallet
================================

One should be able to print the balance of the default wallet, by calling:

```
> moneytracker balance
Balance for my.wallet is +900.00 RON
```

when `moneytracker.config` is:

```
default_wallet = my.wallet

```

and `my.wallet` has the following transactions registered:

```
+1000.00 RON
1445316500;-;111.00;other;RON
1445316500;+;11.00;salary;RON

```

Examples
--------
