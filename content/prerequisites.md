---
title: Prerequisites
description: This covers all the Bonobo Git Server prerequisites.
tags: [Prerequisites, Install, Installation Guide, Quickstart]
---

Prerequisites
=============================

This page covers all the dependencies and prerequisites for Bonobo Git Server installation. For other section check the [documentation](/documentation/) page.

* Internet Information Services 7 and higher
    * [How to Install IIS 8 on Windows 8](http://www.howtogeek.com/112455/how-to-install-iis-8-on-windows-8/)
    * [Installing IIS 8 on Windows Server 2012](http://www.iis.net/learn/get-started/whats-new-in-iis-8/installing-iis-8-on-windows-server-2012)
    * [Installing IIS 7 on Windows Server 2008 or Windows Server 2008 R2](http://www.iis.net/learn/install/installing-iis-7/installing-iis-7-and-above-on-windows-server-2008-or-windows-server-2008-r2)
    * [Installing IIS 7 on Windows Vista and Windows 7](http://www.iis.net/learn/install/installing-iis-7/installing-iis-on-windows-vista-and-windows-7)
* [.NET Framework 4.5](http://www.microsoft.com/en-us/download/details.aspx?id=30653)
    * Windows Vista SP2, Windows 7, Windows 8 and higher
    * Windows Server 2008 R2, Windows Server 2008 SP2, Windows Server 2012 and higher
* [ASP.NET MVC 4](http://www.asp.net/mvc/mvc4)
    * This step is not necessary for Windows Server 2012 R2
    * You can use the [standalone installer](http://www.microsoft.com/en-us/download/details.aspx?id=30683) even though it says it requires VS 2010 and higher.
    * Don't forget to register MVC framework with your IIS
        * Windows 8 - Windows Features: IIS -> WWWS -> Application Development Features -> ASP.NET 4.5.
        * Other - Run `%windir%\Microsoft.NET\Framework\v4.0.30319\aspnet_regiis.exe -ir` with administrator privileges


If everything is ready, let's get started with the [installation](/install/).
