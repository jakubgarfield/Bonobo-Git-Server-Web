---
title: Changelog
description: Tracks changes and bug fixes between different versions of Bonobo Git Server for Windows
tags: [Changelog, Changes, Bug Fixes, Features]
---

## Version 1.2.0

**25 May 2013**

### Description

### Features 

### Bug Fixes

### Compatibility Issues


<hr />


## Version 1.1.0

**9 October 2011**

### Features 

* Administrator can create new user accounts
* Settings
    * Disable anonymous user registration (by default user registration is disabled and only administrator can create new users)
	* Disable creation repository by users (by default only administrator can create new repositories)
* Confirmation for Team, User and Repository removals
    * Security hole with delete on GET removed
* Download link for text based files in repository browser
* Chinese translation added
* Japanese translation added
* Reasonable states returned to git client if authentication failed or if repository does not exists

### Bug Fixes

* Fixed issue with UserConfiguration (config.xml) was invalid after overwriting  with custom values
* MaxRequestLength extended to 100MB for large file upload
* RequestLimit for IIS 7 extended to 100MB for large file upload
* Fixed redirecting from Create actions
* Fixed URL redirecting after Create and Delete actions
* Favicon application error fixed
* Fixed FormsAuthentication redirect call after basic authentication returns 401(and fire up runtime exception)
* Fixed repository delete with read only files
