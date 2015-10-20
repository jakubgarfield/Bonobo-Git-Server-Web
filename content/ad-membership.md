---
title: Install - Active Directory Membership Service
description: Setup  Active Directory Membership Service with Bonobo Git Server
tags: [Install, Installation Guide, Quickstart,  Active Directory Membership Service]
---

 Active Directory Membership Service
=========================

This Membership Service uses Active Directory to control access to Bonobo Git Server.
Users, teams and roles are managed using the standard Active Directory Users and Computers tool built into Windows.

## How to configure Active Directory?

First off, you will have to create an Active Directory group using Active Directory Users and Computers (e.g. *Git*).  Then add all user accounts that you want have access to Bonobo Git Server to that group.  Any account that is not member of this group will not be able to access the Bonobo Git Server web site.

Next, add another Active Directory group that will determine which users have administrative access to the web site (e.g. *GitAdmins*).  You should at least add one user to that group in order to initially set up your repositories.

If you are using teams, create Active Directory groups for each team and add the corresponding users (e.g. *GitTeam1*, *GitTeam2*, etc).

## How to configure Bonobo Git Server?

In order to use the Active Directory Membership Service, change the *MembershipService* value in the **web.config** file located in the root of the application according to the following lines.

~~~
<appSettings>
    ...
    <add key="MembershipService" value="ActiveDirectory" />
    <add key="ActiveDirectoryDefaultDomain" value="domain.local" />
    <add key="ActiveDirectoryBackendPath" value="~\App_Data\ADBackend" />
    <add key="ActiveDirectoryMemberGroupName" value="Git" />
    <add key="ActiveDirectoryTeamMapping" value="Team1=GitTeam1, Team2=GitTeam2" />
    <add key="ActiveDirectoryRoleMapping" value="Administrator=GitAdmins" />
    ...
</appSettings>
~~~
{: .prettyprint}

Replace the *ActiveDirectoryDefaultDomain* with the name of the domain you will be authenticating against.  

Next, set the *ActiveDirectoryMemberGroupName* to the name of the members group you created earlier.   

Finally, set up the Active Directory group name to team name and role name mappings in *ActiveDirectoryTeamMapping* and *ActiveDirectoryRoleMapping*.  In the example configuration above, two teams are created (*Team1* and *Team2*), whose members will be taken from the AD groups named *GitTeam1* and *GitTeam2*, respectively. 

That's it, you're all set.  If you ever need to add or remove users from roles or teams, just use Active Directory Users and Computers to add or remove the corresponding users from the AD groups.  The changes in Active Directory are applied to Bonobo Git Server automatically.  

If you add or remove teams using Active Directory later, don't forget to also adjust *ActiveDirectoryTeamMapping* in the web.config.