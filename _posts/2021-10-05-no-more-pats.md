---
title: No More PATs!
tags: [aws, github, devops, platform]
date: 2021-10-05 18:18:18
---


No more PATs! No more PATs!...well, almost. I was setting up a new local development environment, and found that that you no longer have to cache your Personal Access Tokens forever from GitHub whilst pulling and pushing your code.

Because caching tokens forever is normal, but not ideal, it looks like the fine folks at GitHub now provide a way to store credentials securely–at least on MacOS.

"Git Credential Manager Core (GCM Core) is our recommended way to store your credentials securely and connect to GitHub over HTTPS. With GCM Core, you don't have to manually create and store a PAT, as GCM Core manages authentication on your behalf, including 2FA (two-factor authentication)."

https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git
