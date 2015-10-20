---
title: Install - Migration Notes
description: Migration notes for previous installations
tags: [Install, Installation Guide, Quickstart, Migration notes]
---

Migration Notes
=============================

Due to the recent changes made to the authentication mechanism, please note the following.

1. Make sure you check your existing *web.config* uses **authentication mode "*None*"** for all use cases. Also verify that *Anonymous Authentication* is the only Authentication setting enabled on your Bonobo Git site.  Internal IIS authentication has been completely removed and the new authentication pipeline expects initial requests to be anonymous.
2. If you had **windows authentication** set up according to the previous guide, remove the two separate sites in IIS after backing up the AppData folder and follow the installation instructions in this guide to set up a single site.  The new windows authentication provider will automatically switch between windows authentication for web requests and basic authentication for git access. 