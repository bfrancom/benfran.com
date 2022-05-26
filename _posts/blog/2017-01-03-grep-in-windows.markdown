---
title: Powershell grep
image: images/163.jpg
date: 2017-01-03 17:09:22.000000000 -06:00
---

Just need this little Powershell snippet for later:

`get-childitem . -rec -include *.log | select-string -pattern "ERROR" -casesensitive`
