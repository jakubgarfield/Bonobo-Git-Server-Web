---
title: Install - Windows Authentication
description: Setup windows authentication with Bonobo Git Server
tags: [Install, Installation Guide, Quickstart, Windows Authentication, Git Windows Authentication]
---

Windows Authentication
=========================

This authentication method uses windows authentication in order to access Bonobo Git.  If your users are already authenticated in your internal network, this method will use the corresponding accounts without prompting for credentials again.

While it is possible to use Windows Authentication with the standard [Internal Membership Service](/ef-membership/), keeping settings in sync between Windows and the internal database is a tedious manual task and users could, for example, change their password in either and therefore have to use different credentials for logging in to the web site and using their git client.

So if you are using Windows Authentication, you should consider switching to the [Active Directory Membership Service](/ad-membership/). 

## How to configure Bonobo Git Server?

Set the AuthenticationProvider value in the application **web.config** according to the following lines.

~~~
<appSettings>
    <add key="AuthenticationProvider" value="Windows" />
</appSettings>
~~~
{: .prettyprint}

## Keep in mind

Git is authenticating to the server via Basic Authentication protocol and sends the password as a part of the request. If you want the communication to be safe you have to introduce SSL in your IIS. With the certificate your application will communicate over HTTPS and it will be encrypted.


## Links

* [Installation](/install/)
* [Web Configuration Documentation](/web-config/)

