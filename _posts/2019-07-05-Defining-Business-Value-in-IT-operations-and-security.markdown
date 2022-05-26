---
title: Defining Business Value in IT Operations and Information Security
image: images/170.jpg
date: 2019-07-05 10:22:22.000000000 -06:00
tags: [writing, technical writing, technology, dlp, dlm,infosec]
---

## Summary
By implementing best practices for IT Operations and Information Security, businesses can increase profit by reducing costs and increasing revenue through 3 things:

* Reducing Risk
* Increasing Customer Satisfaction
* Increasing Employee Productivity

## Details

To some, it is difficult to define the business value that IT Operations and Information Security can provide. Breaking down these technical ideas into more business-friendly terms can aid in showing this value, and where improvements should be made. Since Operations and Security are tightly related, they should be evaluated together when considering changes, or new solutions.

Because implementing and changing technology creates business overlap between __reducing costs__, and __increasing revenue__, it is important to get a down a layer further, for a better understanding. These lower layers mentioned above, but reiterated here, are reducing risk, increasing customer satisfaction, and increasing employee productivity.


Diagram of how ops and security relate and drive value:
![How security and ops are related](/images/BusinessValue.png "Business Value in Operations and Security")

While no means comprehensive, this analysis should spark deeper thoughts and conversations.

## Reducing Risk
Information Security is all about reducing legal & technical risk to the business. The triad of Confidentiality, Integrity and Availability must be balanced with risk appetite. Applications, infrastructure, and systems must be available, so an intimate knowledge of system architecture is imperative to secure them effectively.

There are of course mandatory industry compliance requirements like PCI, GDPR, HIPAA, FERPA, SOX, etc, and the more a business understands what is at stake, the better they can address these requirements to protect people, information, and assets.

The goal is to adhere to compliance requirements and to minimize other risks, but also be able to articulate it to the business so they can make informed decisions at the right time. The other side of this is to build in security at each level of the application lifecycle and in the infrastructure layers to prevent incidents, and move gracefully when disaster strikes.


## Automation
### Increased Productivity == Employee Satisfaction == Better Retention

When having to always do those dang manual (nuisance) things which keep interrupting your in-the-zone workflow, it can be a source of pain. Sometimes it is only painful at the individual level, and sometimes it's painful to the whole org.  Sometimes nobody wants to own or fix it, so these nuisances keep dragging on...and keep dragging employees and business down.

As these manual impediments are removed, it lightens the load, and creates bliss. Trust me, I've seen it a thousand times! It could be things like:
* Creating an automated docker container for developers to use 3 different versions of java and maven, so:
    * They don't have to jump through 7 hoops every time they switch projects.
    * It will make onboarding for new developers a breeze.
    * It eases the burden when they change laptops, or get a new machine.
* Automating deployments through pipelines so when Billy is on vacation, his coworker can repeat the process exactly.
* Creating automated backup and retention workflows to adhere to data retention policies — and save your behinds from a disaster.


When infrastructure can be automated through code, it makes life better. Automation not only makes operations better, but makes security better too! It makes security better because it makes availability (patching/backups/upgrading/rolling back) better. It makes it less risky to deploy to production, because all your non-prod environments have a much higher level of parity.  Automation makes it easy to audit, or to change things to meet compliance requirements.


> "Automation not only makes operations better, but makes security better too!" 

## Customer Satisfaction
### Performance
If you can turn gzip on your load balancers and increase your application speed by 75%, it's a no brainer to turn it on. But what if nobody knows it's not on? What if nobody thinks to look? Can a business afford these oversights?

If a method calls the same thing 200x and isn't caching the response, or doesn't actually need it 200x, is it being caught? What if this was on the main page of the application? By removing this, the home page experience can load much more quickly, but someone still has to find where the latency is.

These are the types of things ops and engineering teams should think about to improve performance.

### Errors
What about logging, monitoring, alerting? A lot of the time, logs just get ignored because there are too many, and it's a firehose of information, and there are too many false positives, and. and. and.

When ops/qa/dev work effectively together, they constantly work to keep their logs and alerts effective, informative, and valuable. There is no need to pipe them to `> /dev/null`. They are able tell when they are being DDoS'd or credential stuffed, or if there is a problem with the application. They will take it one step further and take countermeasures to increase security and availability, or otherwise remove the problem.

## Conclusion
Based on what you've read, I hope to have piqued an interest in learning more about technology. We've seen how ops and security are related, and a brief glimpse into how engineering infrastructure can be done successfully.




