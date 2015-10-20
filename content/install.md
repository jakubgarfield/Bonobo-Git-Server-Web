---
title: Install
description: This pages shows you how easy to install Bonobo Git Server is.
tags: [Install, Installation Guide, Quickstart]
---

Install
=============================

This page covers simple Bonobo Git Server installation. Be sure to check [prerequisites](/prerequisites/) page before installation and for other sections visit the [documentation](/documentation/) page.

The following steps covers an installation with Windows 2008 Server and IIS 7. They are exactly the same for any higher platforms (Windows Server 2012 and IIS 8.0+).

* [Download](/) the latest version of Bonobo Git Server from the front page
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

* **Configure Authentication**

Enable **Anonymous Authentication** in IIS and disable the others. To do so, select the application, click on the authentication icon and set the value to of Anonymous Authentication to Enabled. The configuration should look like the following screenshot.

![IIS enable Anonymous Authentication only](/resources/img/installation/iis_authentication_forms.png)



* **Launch your browser** and go to [http://localhost/Bonobo.Git.Server](http://localhost/Bonobo.Git.Server). Now you can see the initial page of Bonobo Git Server and everything is working.
    * Default credentials are username: **admin** password: **admin**

![Launch browser and sign in](/resources/img/installation/install_iis7_git.png)

The authentication and membership service functions have been split up into separate configurable modules in the latest version of Bonobo Git Server.  By default, it is configured to use [Cookie Authentication](/cookie-authentication/) and the [Internal Membership Service](/ef-membership/). 
Please follow up on how to use the different methods using the following sites. 

### Authentication Providers

* [Cookie Authentication](/cookie-authentication/)
* [Windows Authentication](/windows-authentication/)
* [Federation Authentication](/federation-authentication/)

### Membership Services

* [Internal Membership Service](/ef-membership/)
* [Active Directory Membership Service](/ad-membership/)

If you are have a previous version installed, you should review [these migration notes](/migration-notes/).

If you have any issues with the installation try to search [FAQ](/frequently-asked-questions/) and [forum](https://groups.google.com/forum/#!forum/bonobo-git-server).
