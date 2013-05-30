---
title: Features, Roadmap and Screenshots
description: List of features, roadmap and screenshots for Bonobo Git Server for Windows
tags: [Features, Roadmap, Screenshots]
---

Features
===================================

Bonobo Git Server for Windows is a web application you can install on your IIS. It provides you an easy management tool and access to your git repositories.

The main features are

* secure and anonymous access to git repositories,
* user friendly web interface,
* user and team based repository access,
* repository browser,
* commit browser,
* localization.


<hr />


Screenshots
-----------

The first screen you see is the login screen. On the second one administrators can manage git users.

<div class="row-fluid">
    <ul class="thumbnails">
        <li class="span6"><a href="/resources/img/screenshots/login.png" class="thumbnail"><img alt="Login screen" src="/resources/img/screenshots/login.png"></a></li>
        <li class="span6"><a href="/resources/img/screenshots/user-management.png" class="thumbnail"><img alt="User Management" src="/resources/img/screenshots/user-management.png"></a></li>
    </ul>
</div>

Bonobo Git Server shows you the list of all available repositories you'd created. On the detail page you can see the contributors, administrators and teams assigned to the repository.

<div class="row-fluid">
    <ul class="thumbnails">
        <li class="span6"><a href="/resources/img/screenshots/repository-management.png" class="thumbnail"><img alt="Repository Management" src="/resources/img/screenshots/repository-management.png"></a></li>
        <li class="span6"><a href="/resources/img/screenshots/repository-detail.png" class="thumbnail"><img alt="Repository Detail" src="/resources/img/screenshots/repository-detail.png"></a></li>
    </ul>
</div>

Repository browser allows you to see the structure of the project inside the web interface. It can display a content of a file if it is a text one and use a proper syntax highlighting. It also can display images.

<div class="row-fluid">
<ul class="thumbnails">
    <li class="span8"><a href="/resources/img/screenshots/repository-browser.png" class="thumbnail"><img alt="Repository File Browser" src="/resources/img/screenshots/repository-browser.png"></a></li>
    <li class="span4"><a href="/resources/img/screenshots/repository-browser-file.png" class="thumbnail"><img alt="File displayed in repository browser" src="/resources/img/screenshots/repository-browser-file.png"></a></li>
    <li class="span4"><a href="/resources/img/screenshots/repository-browser-image.png" class="thumbnail"><img alt="Image displayed in repository browser" src="/resources/img/screenshots/repository-browser-image.png"></a></li>
</ul>
</div>

Another important part of Bonobo Git Server is the commit history browser. It displays the whole repository history. Each commit can be displayed on the detail page with additional information about the modified, added and deleted files.

<div class="row-fluid">
    <ul class="thumbnails">
        <li class="span6"><a href="/resources/img/screenshots/commits.png" class="thumbnail"><img alt="Commits" src="/resources/img/screenshots/commits.png"></a></li>
        <li class="span6"><a href="/resources/img/screenshots/commit-details.png" class="thumbnail"><img alt="Commit Details" src="/resources/img/screenshots/commit-details.png"></a></li>
    </ul>
</div>


The server is localized to more than 5 languages.

<div class="row-fluid">
    <ul class="thumbnails">
        <li class="span12"><a href="/resources/img/screenshots/localization.png" class="thumbnail"><img alt="Localization" src="/resources/img/screenshots/localization.png"></a></li>
    </ul>
</div>


<hr />


Compatibility
-------------
You should have .NET Framework 4.5 and ASP.NET MVC4 installed on the target machine. The server should be compatible with the following configurations.

* Microsoft Vista & IIS 7+
* Microsoft Windows 7 & IIS 7+
* Microsoft Windows 8 & IIS 7+
* Microsoft Windows 2008 Server & IIS 7+
* Microsoft Windows 2012 & IIS 7+

User interface was tested on these internet browser.

* Internet Explorer 9.0
* Internet Explorer 8.0
* Internet Explorer 7.0, Internet Explorer 6.0 (minor viewing issues)
* Chrome
* Firefox 4.0


<hr />


Roadmap
----------------------------------

Roadmap is a list of short-term and long-term goals. Do you want to <a href="/support/">influence</a> where the project is heading? 

* Switch to libgit2sharp or ngit
    * Faster and more reliable git collaboration
* Support git tags
* Investigate git submodules
* Plugins for post commit actions
* Plugins for schedules actions
