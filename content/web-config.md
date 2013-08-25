---
title: Install - web.config
description: AppSettings documentation for web.config
tags: [Install, Installation Guide, Quickstart, Web Configuration values]
---

Web.Config Documentation
=============================

Short descriptions of values that you might change when configuring Bonobo Git Server. For the simplest setup you don't have to change anything.

## appSettings

UserConfiguration
: Stores the path to Bonobo Git Server user global configuration. Settings like anonymous repository access are stored in this xml.

DefaultRepositoriesDirectory
: Path to the folder where git repositories are stored.

GitPath
: Path to git executables to handle communication

GitServerPath
: Value used by the second instance with [Windows Authentication](/windows-authentication/) setup. It is used in UI to show the path of git repositories on the first instance.

ShouldImportWindowsUserAsAdministrator
: When Basic or Windows authentication is used and new user connects to the server, when he is imported the role Administrator can be assigned to him if this value is set to true.



## connectionStrings

BonoboGitServerContext
: Path to the Bonobo Git Server database.


## system.web

authentication mode="value"
: [Forms authentication](/forms-authentication/) uses None otherwise it should be set to Windows for [Basic](/basic-authentication/) and [Windows](/windows-authentication/) Authentication setup.
