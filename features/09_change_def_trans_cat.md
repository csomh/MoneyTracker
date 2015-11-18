Change default categories for transactions
==========================================

One should be able to change the default categories for the transactions in `moneytracker.config`, by calling:

```
> moneytracker config default_income_category="really big salary"
'really big salary' was configured as default category for incomes.
```

Entry in `moneytracker.config`

```
default_income_category = "really big salary"
```

```
> moneytracker config default_spending_category='I have no clue'
'I have no clue' was configured as default category for spendings.
```

Entry in `moneytracker.config`

```
default_spending_category = "I have no clue"
```

The category of a transaction should be specified as follows:

1. Category specified on the command line (using `-c`/`--category`), if any - OR
2. Category specified in the configuration (values of `default_income_category` or `default_spending_category`), if any - OR
3. Hard-coded default categories `salary` or `other`

Empty entries or missing entries for transaction default category should be considered as 'not configured':

```
default_income_category = ""
```

This will set default category for transaction as empty:

```
moneytracker config default_spending_category=""
```

Both `' '` and `" "` can be used to group category names having spaces on the command line.

The above is also valid for the `-c`/`--category` options for all the commands that support this option.

`" "` is used to group category names having spaces in the configuration and wallet file.
