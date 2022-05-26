---
title: Compiling cloud foundry cf client on OpenBSD
image: images/164.jpg
date: 2017-01-06 17:09:22.000000000 -06:00
---

You need go version 1.7x, so it may be in stable...I went with 6.0 `-current`

```
pkg_add go
cd $HOME
mkdir -p godev/src
cd godev/src
git clone https://github.com/cloudfoundry/cli.git
cd cli
go get .
go install
```

OR, even easier:

Create a new workspace, set `export GOPATH=</path/to/workspace>`, then `cd $GOPATH` and `go get
code.cloudfoundry.org/cli` and it should automatically pull down cli,  
dependencies, and build it into $GOPATH/bin.
