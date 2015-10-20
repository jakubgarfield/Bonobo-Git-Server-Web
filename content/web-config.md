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

## connectionStrings

BonoboGitServerContext
: Path to the Bonobo Git Server database.

