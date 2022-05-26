---
title: Mutt Offline Outlook365 With mbsync
image: images/144.jpg
date: 2014-11-23 17:07:18.000000000 -07:00
tags:
  - writing
  - technical writing 
  - technology
  - mutt
  
---

# Nitty Gritty
I've been using the [mutt](http://www.mutt.org) e-mail client for about two years now.  I love mutt. I'm a die hard Linux/BSD guy, and am in the console a *lot*.  I love mutt's simplicity"<sup><a href="#fn1" id="ref1">1</a></sup> & power. I love being able to customize it.  Mutt's motto is among the best ever penned:
>"All mail clients suck. This one just sucks less." 

It is so fast at e-mail (reading/deleting/sorting/tagging/moving/filtering, etc), that it is hard to use anything else. Yes, I've used other Linux (GUI) e-mail clients such as Thunderbird, Evolution, Geary, SeaMonkey & GroupWise (yes, they have a Linux version).  I've also used proprietary OS/e-mail solutions like Outlook, & Mail.<sup><a href="#fn2" id="ref2">2</a></sup>

I guess the biggest reason I like mutt, is that it adheres to the Unix philosophy of, "doing one thing and doing it well."<sup><a href="#fn3" id="ref3">3</a></sup>

**See my [eBook](https://www.benfrancom.com/ebooks) (Updated for 2019) for a very basic setup to get used to it before attempting the following *highly advanced* configuration.**

After reading [Steve Losh's](http://stevelosh.com/blog/2012/10/the-homely-mutt/) guide to offline imap and mutt, I had to attempt the offline sync functionality he recommended.  Normally I would connect over imaps and do everything realtime, but I wanted the offline functionality in the case I didn't have Internet access, and wanted a local copy for quicker e-mail manipulation.

At first, like Steve, I used offlineimap, but it was too complicated and didn't work quite like I wanted, so, thanks to [Matthias Vogelgesang](http://bloerg.net/2013/10/09/syncing-mails-with-mbsync-instead-of-offlineimap.html), I was able to get isync (mbsync) working.  Instead of gmail, I set my mutt up for my work account which uses Outlook365.

Also, for passwordless authentication, I'm using gpg, instead of some python scripts. It integrates with Gnome's keychain, so it will start upon logging in.  I'll leave it up to you to configure gpg, or the authentication method of your choice.

I run [Arch linux](https://www.archlinux.org/), so you may need to change some things based on your distribution's setup.

## Installation
Install the goods: mutt, isync, msmtp, gpg:

* `pacman -S mutt msmtp gnupg` (Or install your preferred version your way)
* isync needs to be installed from the [AUR](https://aur.archlinux.org/packages/isync/).

## mutt
Configure mutt's `~/.muttrc`.  Most of mine is exactly like Steve Losh's, but with some subtle changes. It can take some tinkering to get it exactly to your liking. Be sure to create files/dirs if they don't already exist. Here's my config:

        # Paths ----------------------------------------------
        set folder           = ~/mail               # mailbox location
        set alias_file       = ~/.mutt/alias         # where to store aliases
        set header_cache     = ~/.mutt/cache/headers # where to store headers
        set message_cachedir = ~/.mutt/cache/bodies  # where to store bodies
        set certificate_file = ~/.mutt/certificates  # where to store certs
        set mailcap_path     = ~/.mutt/mailcap       # entries for filetypes
        set tmpdir           = ~/.mutt/temp          # where to keep temp files
        set signature        = ~/.mutt/sig           # my signature file

        # Account Settings -----------------------------------
        set spoolfile 		= "+work/Inbox" #Default inbox.
        set mbox      		= "+work/Archive"
        set postponed 		= "+work/Drafts"
        set editor		= "vim -c \"set spell spelllang=en\""
        set trash		= "+work/Deleted\ Items"
        set index_format	="%4C %Z %D %-15.15L (%4l) %s"
        set beep_new		=yes
        set copy		=yes
        set sort		="threads"
        set query_command	="lbdbq '%s'"# how to query the exchange ldap database
        bind editor "\t" complete-query #tab completion over ldap
        # Mailboxes to show in the sidebar.
        mailboxes +work/Inbox \
                  +work/Archive \
                  +work/Other \
                  +work/Deleted\ Items \
                  +work/Drafts
        bind index 		"\Ca" 'imap-fetch-mail'
        fcc-hook ~A "+work/Archive" # Saves copies of outgoing mail to         "Archive" folder
        
        # Sidebar Patch --------------------------------------
        set sidebar_delim   	= '  │'
        color sidebar_new color221 color233
        set sidebar_visible 	= yes
        set sidebar_width   	= 30
        # Bind sidebar navigation to CTRL-n, CTRL-p, and CTRL-o
        bind index \CP sidebar-prev
        bind index \CN sidebar-next
        bind index \CO sidebar-open
        bind pager \CP sidebar-prev
        bind pager \CN sidebar-next
        bind pager \CO sidebar-open
        #Status Bar
        set status_chars  = " *%A"
        set status_format = "───[ Folder: %f ]───[%r%m messages%?n? (%n new)?%?d? (%d to delete)?%?t? (%t tagged)? ]───%>─%?p?( %p postponed )?───"

        # Sending mail ---------------------------------------
        set from		="bfrancom@<domain>.org"
        set realname		="Ben Francom" 
        set use_from		="yes"
        set envelope_from	="yes"
        set sendmail		="/usr/bin/msmtp"

        # Header Options -------------------------------------
        ignore *                                # ignore all headers
        unignore from: to: cc: date: subject:   # show only these
        unhdr_order *                           # some distros order things by default
        hdr_order from: to: cc: date: subject:  # and in this order

        # Index View Options ---------------------------------
        set date_format = "%m/%d %I:%M"
        set sort = threads                         # like gmail
        set sort_aux = reverse-last-date-received  # like gmail
        set uncollapse_jump                        # don't collapse on an         unread message
        set sort_re                                # thread based on regex
        #set reply_regexp = "^(([Rr][Ee]?(\[[0-9]+\])?: *)?(\[[^]]+\] *)?)*"

        # Index Key Bindings ---------------------------------
        bind index gg       first-entry
        bind index G        last-entry
        bind index R        group-reply
        bind index <space>  collapse-thread

        # Sync email
        macro index O "<shell-escape>mbsync work<enter>"           "run mbsync to sync all mail"
        macro index o "<shell-escape>mbsync work<enter>" "run mbsync to sync inbox"

        # Saner copy/move dialogs
        macro index C "<copy-message>?<toggle-mailboxes>" "copy a message to a mailbox"
        macro index M "<save-message>?<toggle-mailboxes>" "move a message to a mailbox"
        macro index,pager A   "<tag-thread><tag-prefix-cond><save-message>+work/Archive<enter>"  "Archive all in thread"
        macro index,pager a   "<save-message>+work/Archive<enter>"                               "Archive message"
        macro index       -   "<limit>all\n"                                                     "show all messages (undo limit)"
        macro index       \C_ "<tag-pattern>~N<enter><tag-prefix-cond>N<untag-pattern>~T<enter>" "mark all as read"

        # Sidebar Navigation ---------------------------------
        bind index,pager <down>   sidebar-next
        bind index,pager <up>     sidebar-prev
        bind index,pager <right>  sidebar-open

        # Pager View Options ---------------------------------
        set pager_index_lines = 10 # number of index lines to show
        set pager_context = 3      # number of context lines to show
        set pager_stop             # don't go to next message automatically
        set menu_scroll            # scroll in menus
        set tilde                  # show tildes like in vim
        unset markers              # no ugly plus signs
        set quote_regexp = "^( {0,4}[>|:#%]| {0,4}[a-z0-9]+[>|]+)+"

        # Pager Key Bindings ---------------------------------
        bind pager k  previous-line
        bind pager j  next-line
        bind pager gg top
        bind pager G  bottom
        bind pager R  group-reply

        # Compose View Options -------------------------------
        set realname = "Ben Francom"          # who am i?
        set envelope_from                    # which from?
        set sig_dashes                       # dashes before sig
        set askcc                            # ask for CC:
        set fcc_attach                       # save attachments with the body
        unset mime_forward                   # forward attachments as part of body
        set forward_format = "Fwd: %s"       # format of subject when forwarding
        set forward_decode                   # decode when forwarding
        set reply_to                         # reply to Reply to: field
        set reverse_name                     # reply as whomever it was to
        set include                          # include message in replies
        set forward_quote                    # include message in forwards
        set indent_str="> "
        set check_new=yes
        set timeout=15
        set mail_check=5


## isync
Configure isync's `~/.mbsyncrc`

        IMAPAccount work
        Host outlook.office365.com
        User bfrancom@<domain>.org
        PassCmd "gpg2 -q --for-your-eyes-only --no-tty -d ~/.mailpass.gpg"
        UseIMAPS yes
        CertificateFile /etc/ssl/certs/ca-certificates.crt
        IMAPStore work-remote
        Account work
        MaildirStore work-local
        Path ~/mail/work/
        Inbox ~/mail/work/Inbox
        Channel work
        Master :work-remote:
        Slave :work-local:
        # Or include everything
        Patterns "INBOX" "Other" "Archive" "Drafts" "Deleted Items"
        # Automatically create missing mailboxes, both locally and on the         server
        Create Both
        Expunge Both
        # Save the synchronization state files in the relevant directory
        SyncState *
    
## msmtp
Configure msmtp for outgoing e-mail `~/.msmtprc`

        account work
        host smtp.office365.com
        port 587
        protocol smtp
        auth on
        from bfrancom@<domain>.org
        user bfrancom@<domain>.org
        passwordeval gpg2 -q --for-your-eyes-only --no-tty -d ~/.mailpass.gpg
        tls on
        tls_starttls on
        tls_trust_file ~/outlook.com.crt
        
<br>
<br>
<sup id="fn1">1. Mutt is easy to setup, but if you need to hack it in a way that works best for your workflow, it can take a *lot* of tweaking.  That is why I am writing this article; to help others that may be looking for a similar setup, or for further control.<a href="#ref1">↩</a></sup>

<sup id="fn2">2. This may suprise some that  I was a rabid Apple lover at one point. I've run various versions of OS 8,9,X.  So yes, I was legit far before most Apple followers of today, and have had several iDevices throughout the years.  I did graphic, and video design and have a lot of experience in the Apple ecosystem. However, I grew so tired of the vendor lockin, lack of (or removed functionality), crippled debugging tools, and Apple's litigious nature that they have left a really bad taste in my mouth...I don't think I'll ever be able to un-taste.<a href="#ref2">↩</a></sup>

<sup id="fn3">3. Wikipedia entry on [Unix Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy)<a href="#ref3">↩</a></sup>
