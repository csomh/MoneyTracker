Specify wallet when printing balance
====================================

One should be able to specify the wallet when printing the balance:

```
> moneytracker balance -w my.wallet
Balance for my.wallet is +900.00 RON
> moneytracker balance --wallet my.wallet --category "really big salary"
Balance for "really big salary" in my.wallet is +1000000.00 RON
```
