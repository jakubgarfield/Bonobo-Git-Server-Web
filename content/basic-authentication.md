---
title: Install - Basic Authentication
description: Setup windows authentication with Bonobo Git Server
tags: [Install, Installation Guide, Quickstart, Basic Authentication]
---

Basic Authentication
=========================

Use Basic Authentication if you want your IIS handle the authentication process. The advantage against [Windows Authentication](/windows-authentication/) is that you don't have to install two instances of Bonobo Git Server. Only one instance is running and users are connecting to it with git and web interface as well.

The configuration is very easy but you are losing some comfort of Windows Authentication on the web interface.


## How to configure Bonobo Git Server?

Set the values in the application **web.config** according to the following lines.

~~~
<appSettings>
    <add key="ClientValidationEnabled" value="true" />
    <add key="UnobtrusiveJavaScriptEnabled" value="true" />
    <add key="UserConfiguration" value="~\App_Data\config.xml" />
    <add key="DefaultRepositoriesDirectory" value="~\App_Data\Repositories" />
    <add key="GitPath" value="~\App_Data\Git\git.exe" />
    <add key="ShouldImportWindowsUserAsAdministrator" value="true" />   
</appSettings>

...

<connectionStrings>    
    <add name="BonoboGitServerContext" connectionString="Data Source=|DataDirectory|Bonobo.Git.Server.db" providerName="System.Data.SQLite" />
</connectionStrings>

...

<system.web>
    ...
    <authentication mode="Windows" />
    ...
</sytem.web>
~~~
{: .prettyprint}


## How to configure IIS?

Enable **Basic Authentication** in IIS and disable the others. To do so, select the application, click on the authentication icon and set the value to of Basic Authentication to Enabled. The configuration should look like the following screenshot.

![IIS enable basic authentication only](/resources/img/installation/iis_authentication_basic.png)


## Keep in mind

Git is authenticating to the server via Basic Authentication protocol and sends the password as a part of the request. If you want the communication to be safe you have to introduce SSL in your IIS. With the certificate your application will communicate over HTTPS and it will be encrypted.


## Links

* [Installation](/install/)
* [Web Configuration Documentation](/web-config/)
