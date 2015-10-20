---
title: Install - Forms Authentication
description: Setup forms authentication with Bonobo Git Server
tags: [Install, Installation Guide, Quickstart, Forms Authentication]
---

Cookie Authentication
=========================

This method provides a classic login form, prompting users to enter their username and password.  Once users are authenticated, the server will use an authentication cookie to validate access.

## How to configure Bonobo Git Server?

In order to use the Cookie Authentication Provider, change the AuthenticationProvider value in the **web.config** file located in the root of the application according to the following lines.

~~~
<appSettings>
    ...
    <add key="AuthenticationProvider" value="Cookies" />
    ...
</appSettings>
~~~
{: .prettyprint}


## Keep in mind

Git is authenticating to the server via Basic Authentication protocol and the forms authentication send the password as a part of the request. If you want the communication to be safe you have to introduce SSL in your IIS. With the certificate your application will communicate over HTTPS and it will be encrypted.


## Links

* [Installation](/install/)
* [Web Configuration Documentation](/web-config/)

