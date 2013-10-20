---
title: FAQ
description: This pages shows you how easy to install Bonobo Git Server is.
tags: [FAQ, Question, Bonobo Git Server Questions, Frequently Asked Questions]
---

Frequently Asked Questions
=============================

#### How to clone a repository?

* Go to the **Repository Detail**.
* Copy the value in the **Git Repository Location**.
    * It should look like `http://servername/projectname.git`.
* Go to your command line and run `git clone http://servername/projectname.git`.

#### How do I change my password?

* Click on the **account settings** in the top right corner.
* Enter new password and confirmation.
* Save.

#### How to backup data?

* Go to the installation folder of Bonobo Git Server on the server.
    * Default location is `C:\inetpub\wwwroot\Bonobo.Git.Server`.
* Copy the content of App_Data folder to your backup directory.
* If you changed the location of your repositories, backup them as well.

#### How to change repositories folder?

* Log in as an administrator.
* Go to **Global Settings**.
* Set the desired value for the **Repository Directory**.
    * Directory must exist on the hard drive.
    * IIS User must have proper permissions to modify the folder.
* Save changes.    

#### Can I allow anonymous access to a repository?

* Edit the desired repository (or do this when creating the repository).
* Check **Anonymous** check box.
* Save.

For allowing anonymous push you have to modify global settings.

* Log in as an administrator.
* Go to **Global Settings**.
* Check the value **Allow push for anonymous repositories**
* Save changes.


#### Bonobo Git Server doesn't server CSS

This is a common issue for Windows 8 users, please see the [topic](http://forum.chodounsky.net/viewtopic.php?f=11&t=252). The solution is simple:

* Go to **Turn windows features on or off** screen
* Navigate IS -> WWWS -> Common HTTP Features
* Tick **Static Content**

#### Cloning Error - RPC failed

There are multiple reasons why this error can occure on the client, but the most frequent ones are related to the size of the request. If you encounter this issue try to increase the following values.

* run **git config http.postBuffer [desired size]** on your client, you can try 524288000
* increase **&lt;requestLimits maxAllowedContentLength="[desired size]"&gt;** in web.config; the size could be 1073741824
* increase **&lt;httpRuntime maxRequestLength="[desired size]"&gt;** in web.config; try the value 1024000
