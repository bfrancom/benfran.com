---
title: Cloud Foundry Set JVM Args
image: images/156.jpg
date: 2016-02-09 14:48:57.000000000 -07:00
---
In case you need to set arguments for cloud foundry application on startup:
`cf set-env appname-uat JAVA_OPTS '-Djavax.net.debug=ssl,handshake'`

Or, to set permgen size:

`cf set-env app-name JBP_CONFIG_OPEN_JDK_JRE '{memory_calculator: { memory_sizes: { permgen: 512m }}}'`
