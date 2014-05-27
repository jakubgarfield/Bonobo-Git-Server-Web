---
title: FAQ
description: This pages shows you how easy to install Bonobo Git Server is.
tags: [FAQ, Question, Bonobo Git Server Questions, Frequently Asked Questions]
---

Frequently Asked Questions
=============================

#### How to support Bonobo Git Server?

You can

* contribute,
* promote on your blog,
* tweet about it,
* answer a question on [StackOverflow](http://stackoverflow.com),
* recommend it to your friend or colleague or
* donate.

<div class="donations row-fluid">
  <div class="paypal span3">
    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top" class="text-center">
        <input type="hidden" name="cmd" value="_s-xclick">
        <input type="hidden" name="hosted_button_id" value="LDBBJBMZX7FN2">
        <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
        <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
    </form>
  </div>
  <div class="blockchain-btn span6" data-address="1NJUB7ZhsCSfz3p9VwwVgi7nPyByF3dhPP" data-shared="false">
    <div class="blockchain stage-begin">
        <img src="https://blockchain.info//Resources/buttons/donate_64.png"/>
    </div>
    <div class="blockchain stage-loading" style="text-align:center">
        <img src="https://blockchain.info//Resources/loading-large.gif"/>
    </div>
    <div class="blockchain stage-ready">
         <p align="center">Please Donate To Bitcoin Address: <b>[[address]]</b></p>
         <p align="center" class="qr-code"></p>
    </div>
    <div class="blockchain stage-paid">
         Donation of <b>[[value]] BTC</b> Received. Thank You.
    </div>
    <div class="blockchain stage-error">
        <font color="red">[[error]]</font>
    </div>
  </div>
  <div class="gittip span3">
    <p><a href="https://www.gittip.com/jakubgarfield/"><img src="/resources/img/gittip.png" /></a></p>
  </div>
</div>

Thank you for using this project and your support.

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

#### SSL and large repositories

When using SSL and pushing large repository you should increase the variable size as described above and if it still doesn't help you should apply the following Microsoft patch ([KB2634328](http://support.microsoft.com/kb/2634328/en-us)). 
