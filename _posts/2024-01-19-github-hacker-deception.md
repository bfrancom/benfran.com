---
title: Deceptive Naming Techniques
tags: [github, hacking, security]
date: 2024-01-19 18:18:18
---

## Interesting Deceptive Naming Techniques

I work regularly administering GitHub and 100's of repos across multiple organizations and came across something a little off kilter the other day.

I found a user named `eng-admins`. Not interesting at a first glance, but kind of weird, eh? Here is their GitHub page (archived for reference):
[https://web.archive.org/save/https://github.com/eng-admins?tab=overview&from=2023-12-01&to=2023-12-31](https://web.archive.org/save/https://github.com/eng-admins?tab=overview&from=2023-12-01&to=2023-12-31)

![Alt text](/images/eng-admins-gh-user.png)

It looks like a __team__ name, even though it is an active GitHub __user__ account.

## Why the problem?

`eng-admins` is likely a default name any admin would use for a team name. It would be very easy to accidentally add this user to an existing team since the name is so generic.

I reported it to GitHub, since the user never has never committed any code...Not that it would be hard for said person to get around that. I do wonder about other generically named users out there.

Easy enough to fix though, right? Just prepend your team names with something like your company name like: `microsoft-eng-all`. Well, easy enough until someone creates a user that is named the same.

## Reminds me

This reminds me of a similar problem in O365 involving groups. See more at: [https://support.microsoft.com/en-us/office/create-a-group-in-outlook-04d0c9cf-6864-423c-a380-4fa858f27102#ID0EBF=Windows](https://support.microsoft.com/en-us/office/create-a-group-in-outlook-04d0c9cf-6864-423c-a380-4fa858f27102#ID0EBF=Windows)

This assumnes creating groups is allowed in your organization. The problem involves setting up a group name in Outlook like that of someone in power, say like Bill Gates, or CxO somewhere.

If your normal email pattern is `bill.gates@contoso.com`, you could set up a group named similarly:
`bill.gates.group@contoso.com`.

Then anyone emailing said group may not look at autocompletion and email the wrong person (or group in this case) with potentially sensitive information.

This could be either an insider threat or external threat if somone's credentials are compromised.

We could also assume said threat could store and forward the email to the correct recipient and this becomes a quasi-man-in-the-middle attack as they now become the relay.

Remember children: All your base are belong to us.
