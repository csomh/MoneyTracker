# MoneyTracker

MoneyTracker is an application which helps you keep an eye on your personal
budget.

For now it works from the command line (all love the command line, right?),
and you can control by passing some fancy commands and parameters to it.

To track your spendings and incomes, you use a wallet, which starts with an
initial amount. Each spending and income is recorded in this wallet, and
one will be able to get some really smart aggregated data out of this, like:
- current balance
- balance at a specific time (in the past or future)
- totals for incomes and/or spendings (for a period of time)
- list of operations in the wallet, filtered for a period of time

The following recording features are available:
- record spending or income
- recording might be done in a default currency or one specified in the command
- recording might be done with the current time or one specified in the command
  (it is possible to make a record in the past or future)
- each spending or income has a category. When recording this might be a default
  one, or one specified in the command line
- default values for currency and category for spending and income are specified
  in a configuration file.
- Conversion rates for currencies are specified in the configuration file

There are commands to change the configuration (including the file where the
wallet is stored.)

The wallet file looks like this:

```
+1000.00 RON
1444216713;+;200.00;"salary advance";RON
1444218713;-;10.00;food;RON
1444296713;-;200.00;travel;EUR
```

The configuration file looks like this:

```
wallet = my.wallet
default_currency = RON
default_income_category = salary
default_spending_category = other
currencies = RON, EUR, USD
rate_EUR_RON = 4.42
rate_RON_EUR = 0.23
rate_USD_RON = 3.92
rate_EUR_USD = 1.13
```

## Feature list breakdown

1. [Create wallet](/01_create_wallet.md)
2. [Add income](/02_add_income.md)
