---
title: Install - Federation Authentication
description: Setup ADFS authentication with Bonobo Git Server
tags: [Install, Installation Guide, Quickstart, Federation Authentication, ADFS]
---

Federation Authentication
=========================

This authentication method uses an ADFS server to authenticate access to Bonobo Git.  The main benefit of using this method is that it is providing single-sign-on capabilities across all of your web sites, if the other sites support federation authentication as well.  

## How to configure ADFS?

Setting up an ADFS server is beyond the scope of this page, but there are a lot of articles you can read on [TechNet](<https://technet.microsoft.com/en-us/library/cc772128%28v=ws.10%29.aspx>).

You will need to get the *metadata address* and *realm* for the trust you created in the ADFS configuration tool in order to configure Bonobo Git. No special claims will have to be issued, as the claims are internally handled by the [Active Directory Membership Service](/ad-membership/). 

## How to configure Bonobo Git Server?

Set up the [Active Directory Membership Service](/ad-membership/).

Set the AuthenticationProvider in the application **web.config** according to the following lines.

~~~
<appSettings>
    ...
    <add key="AuthenticationProvider" value="Federation" />
    <add key="MembershipService" value="ActiveDirectory" />
    <add key="FederationMetadataAddress" value="https://sts.domain.local/federationmetadata/2007-06/federationmetadata.xml" />
    <add key="FederationRealm" value="https://git.domain.local" />
    ...
</appSettings>
~~~
{: .prettyprint}

Replace the *FederationMetadataAddress* and *FederationRealm* values with the ones you configured using the ADFS configuration tool.

## Keep in mind

Git is authenticating to the server via Basic Authentication protocol and sends the password as a part of the request. If you want the communication to be safe you have to introduce SSL in your IIS. With the certificate your application will communicate over HTTPS and it will be encrypted.


## Links

* [Installation](/install/)
* [Web Configuration Documentation](/web-config/)

