---
title: Install - Windows Authentication
description: Setup windows authentication with Bonobo Git Server
tags: [Install, Installation Guide, Quickstart, Windows Authentication, Git Windows Authentication]
---

Windows Authentication
=========================

This authentication is very useful when your git server sits inside the company network and your accounts and logging information could be managed via IIS. The advantage of this approach is that your users won't have to create another account for logging to Bonobo Git Server. They will use the existing Windows account they use on the network.

The Windows Authentication is the hardest one to set up. It requires **two instances** of Bonobo Git Server running on the IIS. The first is used for handling git communication and the second one is used for the web interface. 

[Install](/install/) both application as if you would normally. Name the first one **Bonobo.Git.Server** and the second one **Bonobo.Git.Server.Interface** (it is not mandatory, but you have to be carefull during the further steps).

If you want to access the web interface you are going to use the address *http://yourcompany.com/Bonobo.Git.Server.Interface* and for cloning your repository it is going to be *http://yourcompany.com/Bonobo.Git.Server/MyRepository.git*.


## How to configure Bonobo Git Server?

You have to configure the first application (Bonobo.Git.Server) as it would be the [Basic Authentication](/basic-authentication/) one. Set the values in the application **web.config** accordingly to the following lines.

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

For the second one, Bonobo.Git.Server.Interface, let's assume that you install the application to the standard C:\inetpub\wwwroot\ location. Otherwise change the values according to your location. The second web.config should look like this.

~~~
<appSettings>
    <add key="ClientValidationEnabled" value="true" />
    <add key="UnobtrusiveJavaScriptEnabled" value="true" />
    <add key="UserConfiguration" value="C:\inetpub\wwwroot\Bonobo.Git.Server\App_Data\config.xml" />
    <add key="DefaultRepositoriesDirectory" value="C:\inetpub\wwwroot\Bonobo.Git.Server\App_Data\Repositories" />
    <add key="GitPath" value="C:\inetpub\wwwroot\Bonobo.Git.Server\App_Data\Git\git.exe" />
    <add key="GitServerPath" value="http://localhost/Bonobo.Git.Server/" />
    <add key="ShouldImportWindowsUserAsAdministrator" value="true" />   
</appSettings>

...

<connectionStrings>    
    <add name="BonoboGitServerContext" connectionString="Data Source=C:\inetpub\wwwroot\Bonobo.Git.Server\App_Data\Bonobo.Git.Server.db" providerName="System.Data.SQLite" />
</connectionStrings>

...

<system.web>
    ...
    <authentication mode="Windows" />
    ...
</sytem.web>
~~~
{: .prettyprint}

As you might notice the values in this config file points to the first application. Therefore, one database and one folder is used to store repositories and database. 

The value **GitServerPath** is important for the UI and you should set it up to point at the first instance (eg. http://yourcompany.com/Bonobo.Git.Server).


## How to configure IIS?

Enable **Basic Authentication** in IIS and disable the others for the first application. To do so, select the application, click on the authentication icon and set the value to of Basic Authentication to Enabled. The configuration should look like the following screenshot.

![IIS enable basic authentication only](/resources/img/installation/iis_authentication_basic.png)

For the second application enable **Windows Authentication** in IIS and disable the others for the first application.

![IIS enable basic authentication only](/resources/img/installation/iis_authentication_windows.png)


## Keep in mind

Git is authenticating to the server via Basic Authentication protocol and sends the password as a part of the request. If you want the communication to be safe you have to introduce SSL in your IIS. With the certificate your application will communicate over HTTPS and it will be encrypted.


## Links

* [Installation](/install/)
* [Web Configuration Documentation](/web-config/)

