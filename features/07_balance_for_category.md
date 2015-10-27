Print balance for default wallet
================================

One should be able to print the balance of the default wallet for a given
category, by calling:

```
> moneytracker balance -c salary
Balance for 'salary' in my.wallet is +11.00 RON
```

or

```
> moneytracker balance --category salary
Balance for 'salary' in my.wallet is +11.00 RON
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

If no transaction is registered for the given category in the wallet file, the
following indication should be given (note: this is not an error, just an
information for the user):

```
No transaction with category 'unexistent' is registered in my.wallet.
```

A use case where both incomes and spendings are registered with the same
category is valid: the balance printed should be the sum of incomes minus the
sum of spendings.

The printing should always indicate the type of the transaction with the +/-
sign: in the example above printing the balance for 'other' would result in the
following message:

```
Balance for 'other' in my.wallet is -111.00 RON
```
