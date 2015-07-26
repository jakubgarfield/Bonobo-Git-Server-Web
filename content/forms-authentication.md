---
title: Install - Forms Authentication
description: Setup forms authentication with Bonobo Git Server
tags: [Install, Installation Guide, Quickstart, Forms Authentication]
---

Forms Authentication
=========================

This method should be used when you don't want your Internet Information Services to handle the authentication. Therefore, use it when you want to keep the users separated from the Windows Authentication process or you don't have it configured at all.

You want to use this mode when you handle connection from outside your network---keep in mind though that with VPN you can use Windows Authentication as well. Also, forms authentication was the only mode available in Bonobo Git Server until version 2.0.


## How to configure Bonobo Git Server?

The default settings should be already configured for this mode. If it, for any reason, isn't so, you should simply change few values in the **web.config** file located in the root of the application.

~~~
<appSettings>
    <add key="ClientValidationEnabled" value="true" />
    <add key="UnobtrusiveJavaScriptEnabled" value="true" />
    <add key="UserConfiguration" value="~\App_Data\config.xml" />
    <add key="DefaultRepositoriesDirectory" value="~\App_Data\Repositories" />
    <add key="GitPath" value="~\App_Data\Git\git.exe" />
    <add key="ShouldImportWindowsUserAsAdministrator" value="false" />
</appSettings>

...

<connectionStrings>
    <add name="BonoboGitServerContext" connectionString="Data Source=|DataDirectory|Bonobo.Git.Server.db" providerName="System.Data.SQLite" />
</connectionStrings>

...

<system.web>
    ...
    <authentication mode="None" />
    ...
</sytem.web>
~~~
{: .prettyprint}


## How to configure IIS?

Enable **Anonymous Authentication** in IIS and disable the others. To do so, select the application, click on the authentication icon and set the value to of Anonymous Authentication to Enabled. The configuration should look like the following screenshot.

![IIS enable Anonymous Authentication only](/resources/img/installation/iis_authentication_forms.png)


## Keep in mind

Git is authenticating to the server via Basic Authentication protocol and the forms authentication send the password as a part of the request. If you want the communication to be safe you have to introduce SSL in your IIS. With the certificate your application will communicate over HTTPS and it will be encrypted.


## Links

* [Installation](/install/)
* [Web Configuration Documentation](/web-config/)

