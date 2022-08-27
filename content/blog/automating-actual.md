---
title: Automating transaction imports with Actual
date: 2022-08-16
description: Setting up a YNAB, sans subscription fees.
tags: [finance, python, javascript, bash, "project-writeup", 2022]
---

My fianc&eacute;, who is a CFP, recently encouraged me to finally set up a budget. I found [Actual](https://actualbudget.com/) to be the most appropriate client for me; I love the nice design and the very responsive devteam. So far it's a wonderful open-source project that I want to contribute to in the future.

The killer feature Actual is currently missing is inbuilt transaction import. Apparently this is in development through Plaid integration, but I can't find a timeline on this, and in order for me to be able to stick with a budget I need to not have to manually type in a payee, date, and amount every time I buy something. Attempts to connect to my bank via OFX all failed, because apparently individual developers don't use OFX anymore.

So I wrote it myself. My solution is not particularly elegant, but it does work for me.

## Why Actual?

As I mentioned above, Actual is **open-source** and **cross-platform** with **a very pretty interface** and **a responsive community.** Critically, it also has **a fairly complete API.** The only other open-source solution I was able to find was [Firefly III](https://www.firefly-iii.org/), which seems really nice and featureful, but I really don't think I'm enough of a finance type to pick up double-entry bookkeeping --- I'm not running a business or starting a portfolio or anything, I just want to know where my money is going.

I eschewed [YNAB](https://www.youneedabudget.com/) and its kin because I can't understand paying $15/mo for something I have the technical expertise to set up myself for nothing more than server fees. I do like the zero-based system, though --- it's easy to understand and fits my use case. The author of Firefly III has posted [a pretty good critique of zero-based systems](https://docs.firefly-iii.org/firefly-iii/about-firefly-iii/zero-based-budgeting/). I'm not wise enough to dispute it. Maybe I'll switch sometime in the future, but for now I believe I have my needs met.

## My toolchain

I have my bank account configured to send me emails for each withdrawal or deposit.{{% sidenote %}}I have to imagine that most banks will let you do this.{{% /sidenote %}} I use [hydroxide](https://github.com/emersion/hydroxide) and good old [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/) to scrape transaction data from these emails, which I dump to a JSON file.

Actual's API is written in Node, and it wasn't too hard to write a little script to auto-import JSON data from a file. I automated this with `cron` and hey, presto.

## The scripts

[`mail.py`](https://github.com/sverona/actual-import/blob/master/mail.py) is responsible for pulling transactions out of my email. Here is my very simple transaction class, plus a conversion to [Actual's internal JSON format](https://actualbudget.com/docs/developers/API/#transaction).

```python
@dataclass
class Transaction:
    date: str
    payee: str
    amount: int

def convert_transaction(trans: Transaction) -> dict:
    return { "date": trans.date,
             "payee_name": trans.payee,
             "amount": trans.amount }
```

There are some bank-specific parts that aren't worth showing --- functions `parse_withdrawal` and `parse_deposit` that take an IMAP server connection plus an email's IMAP index and return a `Transaction`. You'll need to write these yourself.

```python
def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("-o", "--out", help="JSON file to write transactions to. If not specified, use stdout.")
    args = parser.parse_args()

    json_transactions = []
    with imaplib.IMAP4(port=1143) as conn:
        conn.login(username, bridge_password)
        conn.select()
        resp, withdrawal_emails = conn.search(None, '(SUBJECT "PNC")')
        if resp == "OK":
            print(resp, withdrawal_emails)

            idxs = withdrawal_emails[0].split()
            for idx in idxs:
                transaction = parse_withdrawal(conn, idx)
                json_transactions.append(convert_transaction(transaction))
        
        resp, deposit_emails = conn.search(None, '(SUBJECT "Deposit")')
        if resp == "OK":
            print(resp, deposit_emails)

            idxs = deposit_emails[0].split()
            for idx in idxs:
                transaction = parse_deposit(conn, idx)
                json_transactions.append(convert_transaction(transaction))

    if args.out:
        with open(args.out, "w") as outfile:
            json.dump(json_transactions, outfile)
    else:
        print(json.dumps(json_transactions))

if __name__ == "__main__":
    main()
```

[`import-transactions.js`](https://github.com/sverona/actual-import/blob/master/import-transactions.js), well, imports exported transactions into Actual. The main difficulty with writing this was figuring out how to call the *internal* API, since the external API is still in the midst of being moved over to a self-hosted architecture.

```js
await actual.init({
  config: { dataDir: path.join(dirname, 'user-files') }
});

await actual.internal.send('load-budget', { id: 'budget-uuid' });
const accounts = await actual.getAccounts();
await actual.internal.send('api/accounts-get').then( accounts => {
  const acctId = accounts[0].id;
  actual.internal.send('transactions-import', {accountId: acctId, transactions: data} ).then( imported => {
    console.log(`Imported ${imported.length} transactions.`);
  }).then( nothing => actual.internal.send('close-budget') );
});
```

Finally, a little shell script that ties the workflow together.

```sh
#!/bin/sh

filename="/root/transactions/$(date "+%s").json"

python mail.py -o $filename
node import-transactions.js $filename
```

I hope all this is helpful to someone. Happy hunting!
