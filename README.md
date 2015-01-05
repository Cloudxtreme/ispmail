# ISPmail

ISPmail Install Script for Ubuntu 14.04 LTS

## History

In my career as an IT professional, many times the need for a mail server arose. Naively as I was, I set out to set up a simple, easy to use and stable email server. Email being one of the cornerstones of modern online communication, I though this would be a rather trivial task.

You know what happened.

Weeks of increasingly frustrating searching, testing, head shaking and hair pulling often lead me to simply sell a Kerio Connect license to the client asking for a server and be done with it. Mostly because the point of groupware functionality was checked off the list with one swoop. Have you ever tried even *finding* let alone *setting up* a groupware suite with Mac OS X compatibility that works for Mail.app, Calendar.app and Contacts.app? That possibly even offers a web interface which doesn't look like it's still 1998? That doesn't get spammed into oblivion several days after turning it on. Something that doesn't force you to install CentOS to work? Something you could even run off your Raspberry Pi? Something that doesn't need a commercial license to perform functions that are now considered as being basic for most workflows. And that still does not take days to set up?

I used to be believe that someone far smarter than me surely had thought of that before and created something useful. Imagine my surprise when all I found were scattered bits, half-baked tutorials (with notable exceptions) and lots of "complete packages", being every way as bloated as the software they were trying to replicate -- mostly Microsoft Exchange.

## What and Why?

This is an attempt to create an install script you can run on Ubuntu 14.04 LTS that will, with some manual input, set up a best-of-class mail server, relying on the following components:

* Postfix
* Dovecot
* MySQL
* dspam
* fail2ban
* Apache
* Roundcube

I aim to strike the right balance between being opinionated about most initial configurations but offering every freedom to change it to your liking. It will never feature a web-based installer. It *will* however be so simple to install that even a complete beginner will manage it -- despite the fact that said beginner will probably not know how to actually put it to use.

Hopefully when that's done, I can turn my attention towards CalDAV and CardDAV functions, with full integration into Roundcube, working calendar invitations via email and smooth Mac OS X/iOS interoperability. This *will* take time to get it right but I'm confident the end result will be worth it.

## Contributions

I'm more than happy to accept contributions. Be it in the form of ideas, pointers or actual code.

## License

The MIT License (MIT)

Copyright (c) 2015 Marcel Bischoff

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
