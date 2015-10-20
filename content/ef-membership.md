---
title: Install - Internal Membership Service
description: Setup Internal Membership Service with Bonobo Git Server
tags: [Install, Installation Guide, Quickstart, Internal Membership Service]
---

Internal Membership Service
=========================

This Membership Service stores user credentials, roles and teams in a local database.  It is useful if your network is not part of an Active Directory domain and also if you simply don't want or need to integrate Git access into your domain.

## How to configure Bonobo Git Server?

In order to use the Internal Membership Service, change the *MembershipService* value in the **web.config** file located in the root of the application according to the following lines.

~~~
<appSettings>
    ...
    <add key="MembershipService" value="Internal" />
    ...
</appSettings>
~~~
{: .prettyprint}

That's it, you can now use the Bonobo Git Server web page to add users, create roles and teams.