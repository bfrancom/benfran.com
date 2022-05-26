---
title: 'REMUS: Transparent high availability for Xen'
image: images/90.jpg
date: 2010-03-09 13:38:10.000000000 -07:00
---
I read about an interesting tool that is being integrated into Xen that offers high availability.  It is developed by The University of British Columbia.
<blockquote>Our approach encapsulates protected software in a virtual machine, asynchronously propagates changed state to a backup host at frequencies as high as forty times a second, and uses speculative execution to concurrently run the active VM slightly ahead of the replicated system state.</blockquote>
http://dsg.cs.ubc.ca/remus/

This is pretty interesting for High Availability in virtual machines.
<blockquote>Remus is a novel system for retrofitting high availability onto existing software running on commodity hardware. The system uses virtualization to encapsulate a protected VM, and performs frequent whole-system checkpoints to asynchronously replicate the state of a single speculatively executing virtual machine.</blockquote>
http://dsg.cs.ubc.ca/remus/papers/remus-nsdi08.pdf
