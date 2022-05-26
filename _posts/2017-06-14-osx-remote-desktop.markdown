---
title: Automating OS X and Microsoft Remote Desktop
image: images/166.jpg
date: 2017-06-14 16:12:22.000000000 -06:00
---

This is to help automate MS RDP in Sierra (should work in other versions)

Make a function in you shell for remote desktop client, in my case `.zshrc`

{% highlight bash %}
rd() {
for i in "$@"
do
  echo "$i"
  command open  "rdp://full%20address=s:$i:3389&audiomode=i:0&disable%20themes=i:1&smart%20sizing:i:1" \
    </dev/null >/dev/null 2>&1 &
done
}
{% endhighlight %}

We pass two args in case they are in a cluster. If your cluster is > 2, modify accordingly. The URI format is defined [here](https://web.archive.org/web/20170614225557/https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-uri)

Create an alias in your .zshrc (or other shell file) like so:

`alias appnameprod=(rd server01 server02 &)`

Be sure to use the fqdn of the server above for the next steps to work.

Get certs from your servers to put into the keychain

`mkdir /tmp/certs ; for i in server02 server02;do openssl s_client -showcerts -connect $i:3389 </dev/null 2>/dev/null|openssl x509 -outform PEM >/tmp/certs/$i.pem;done\n`

Import the certs into keychain

`cd /tmp/certs/ ; for i in *; do sudo security add-trusted-cert -d -r trustRoot -k "$HOME/Library/Keychains/login.keychain" $i;done`

Source your .zshrc and then type your alias `appnameprod` and if everything is ok, it will bring up your cluster.
