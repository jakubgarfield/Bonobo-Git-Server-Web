---
title: Install - Federation Authentication
description: Setup ADFS authentication with Bonobo Git Server
tags: [Install, Installation Guide, Quickstart, Federation Authentication, ADFS]
---

Federation Authentication
=========================

This authentication method uses an ADFS server to authenticate access to Bonobo Git.  The main benefit of using this method is that it is providing single-sign-on capabilities across all of your web sites, if the other sites support federation authentication as well.  

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

## How to configure ADFS?

We'll give you a recipe here, but if you need more information there is lots on [TechNet](<https://technet.microsoft.com/en-us/library/cc772128%28v=ws.10%29.aspx>).

You will need to get the *metadata address* and *realm* for the trust you created in the ADFS configuration tool in order to configure Bonobo Git. No special claims will have to be issued, as the claims are internally handled by the [Active Directory Membership Service](/ad-membership/). 


1. Open AD FS Management
2. Click `Add Relying Party Trust`
3. Choose `Claims aware` and click `Start`
4. Choose `Enter data about the relaying party manually` and click `Next`
5. Enter a display name and a description if you want to and click `Next`
6. We can skip this page so just click `Next`
7. Choose `Enable support for the WS-Federation Passive protocol` and enter the URL to your git server (must be https)
8. Add the contents of your web.config `FederationRealm` to `Relying party trust identifier` if it differs from your url and click `Next`
9. Now just click `Next` and `Next`, leave `Configure claims issuance policy for this application` checked and then `Close`

Now we are at the `Edit Claims Issuance Policy for **your name**`, we have to add four rules here.
1. Click `Add Rule`
2. Choose `Send Claims Using a Custom Rule` and click `Next`
3. Enter a `Claim rule name`, use `Active Directory` for example
4. Paste the following in `Custom rule`: 
`c:[Type == "http://schemas.microsoft.com/ws/2008/06/identity/claims/windowsaccountname", Issuer == "AD AUTHORITY"]
 => issue(store = "Active Directory", types = ("http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn", "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname", "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname", "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress", "http://schemas.microsoft.com/ws/2008/06/identity/claims/role",
"http://temp.org/identity/claims/adObjectGuidBase64org"), query = ";sAMAccountName,givenName,sn,mail,tokenGroups,ObjectGuid;{0}", param = c.Value);`
5. Click `Finish`

And the second rule:
1. Click `Add Rule`
2. Choose `Send Claims Using a Custom Rule` and click `Next`
3. Enter a `Claim rule name`, use `Name ID` for example
4. Paste the following in `Custom rule`: 
`c:[Type == "http://temp.org/identity/claims/adObjectGuidBase64org"]
 => issue(Type = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier", Issuer = c.Issuer, OriginalIssuer = c.OriginalIssuer, Value = c.Value, ValueType = c.ValueType, Properties["http://schemas.xmlsoap.org/ws/2005/05/identity/claimproperties/format"] = "urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified");`
5. Click `Finish`

The third rule:
1. Click `Add Rule`
2. Choose `Send Group Membership as a Claim` and click `Next`
3. Enter `Administrator` at `Claim rule name`
4. Select your administrators group as defined in web.config for `ActiveDirectoryRoleMapping`
5. At `Outgoing claim type` select `Role`
6. Enter `Administrator` at `Outgoing claim value`
7. Click `Finish`

The fourth rule:
1. Click `Add Rule`
2. Choose `Send Group Membership as a Claim` and click `Next`
3. Enter `Member` at `Claim rule name`
4. Select your administrators group as defined in web.config for `ActiveDirectoryMemberGroupName`
5. At `Outgoing claim type` select `Role`
6. Enter `Member` at `Outgoing claim value`
7. Click `Finish`

All we have to do now is click `Close` and AD FS has been setup correctly. Now configure Bonobo Git Server for ADFS

## Keep in mind

Git is authenticating to the server via Basic Authentication protocol and sends the password as a part of the request. If you want the communication to be safe you have to introduce SSL in your IIS. With the certificate your application will communicate over HTTPS and it will be encrypted.


## Links

* [Installation](/install/)
* [Web Configuration Documentation](/web-config/)

