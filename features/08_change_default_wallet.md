Change default wallet in configuration
======================================

One should be able to change the default wallet specified in `moneytracker.config`,
by calling:

```
> moneytracker config default_wallet=new.wallet
'new.wallet' was configured as default.
```

The path given after the `=` is a relative or absolute path, should be taken as
it is.

No check should be made whether the new wallet exists or can be opened (this
error will be raised on command requiring to open the wallet.)

Space characters around the `=` should be stripped.

The `config` command without a parameter should list the content of
`moneytracker.config`.

Error in case value to be changed in configuration is not a valid value name
(i.e. this time means: it is other than `default_wallet`):

```
> moneytracker config some_val =  garbage
'some_val' is not a valid configuration value.
```

or

```
> moneytracker config default_wallet_ =  garbage
'default_wallet_' is not a valid configuration value.
```

`moneytracker.config` should be updated as follows:
* if there was no `default_wallet` configured, the configuration value with the
file specified should be added
* if there was a `default_wallet` with no value specified (i.e `default_wallet=`)
the file specified should be added after the `=` sign.
* if there were multiple `default_wallet` values specified the first one should
be updated (as it is the first one that is read).

When old values are replaced in the configuration file, the following format
should be used:

```
default_wallet = new.wallet
```

(i.e. if there were extra space characters around the `=` sign or after the file
name, those should be stripped - or better said: any poor formatting of existing
configuration lines should be discarded.)
