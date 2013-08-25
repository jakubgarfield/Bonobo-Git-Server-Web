---
title: Install
description: This pages shows you how easy to install Bonobo Git Server is.
tags: [Install, Installation Guide, Quickstart]
---

Install
=============================

This page covers simple Bonobo Git Server installation. For other section check the [documentation](/documentation/) page.

### Prerequisites

* Internet Information Services 7 and higher
    * [How to Install IIS 8 on Windows 8](http://www.howtogeek.com/112455/how-to-install-iis-8-on-windows-8/)
    * [Installing IIS 8 on Windows Server 2012](http://www.iis.net/learn/get-started/whats-new-in-iis-8/installing-iis-8-on-windows-server-2012)
    * [Installing IIS 7 on Windows Server 2008 or Windows Server 2008 R2](http://www.iis.net/learn/install/installing-iis-7/installing-iis-7-and-above-on-windows-server-2008-or-windows-server-2008-r2)
    * [Installing IIS 7 on Windows Vista and Windows 7](http://www.iis.net/learn/install/installing-iis-7/installing-iis-on-windows-vista-and-windows-7)
* [.NET Framework 4.5](http://www.microsoft.com/en-us/download/details.aspx?id=30653)
    * Windows Vista SP2, Windows 7, Windows 8 and higher
    * Windows Server 2008 R2, Windows Server 2008 SP2, Windows Server 2012 and higher
* [ASP.NET MVC 4](http://www.asp.net/mvc/mvc4)
    * You can use the [standalone installer](http://www.microsoft.com/en-us/download/details.aspx?id=30683) even though it says it requires VS 2010 and higher.
    * Don't forget to register MVC framework with your IIS
        * Windows 8 - Windows Features: IIS -> WWWS -> Application Development Features -> ASP.NET 4.5.
        * Other - Run `%windir%\Microsoft.NET\Framework\v4.0.30319\aspnet_regiis.exe -ir` with administrator privileges


<hr />


### Installation

These steps ilustrates simple installation with Windows 2008 Server and IIS 7. They are exactly the same for higher platforms (Windows Server 2012 and IIS 8.0).

* **Extract the files** from the installation archive to `C:\inetpub\wwwroot`

![Copy the files from archive](/resources/img/installation/install_iis7_copy.png)

* **Allow IIS User to modify** `C:\inetpub\wwwroot\Bonobo.Git.Server\App_Data` folder. To do so
    * select Properties of App_Data folder,
    * go to Security tab, 
    * click edit, 
    * select IIS user (in my case IIS_IUSRS) and add Modify and Write permission,
    * confirm these settings with Apply button.

![Set permissions for App_Data](/resources/img/installation/install_iis7_appdata.png)

* **Convert Bonobo.Git.Server to Application** in IIS
    * Run IIS Manager and navigate to Sites -> Default Web Site. You should see Bonobo.Git.Server.
    * Right click on Bonobo Git Server and convert to application.
    * Check if the selected application pool runs on .NET 4.0 and convert the site.

![Convert to a web application](/resources/img/installation/install_iis7_iis2.png)


* **Launch your browser** and go to [http://localhost/Bonobo.Git.Server](http://localhost/Bonobo.Git.Server). Now you can see the initial page of Bonobo Git Server and everything is working.
    * Default credentials are username: **admin** password: **admin**

![Launch browser and sign in](/resources/img/installation/install_iis7_git.png)
