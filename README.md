# bonobogitserver.com

The site uses [nanoc](https://nanoc.ws/) -- a static site generator -- to convert a few md pages into html. It is also powered by [github pages](https://pages.github.com/).

There is a `master` branch with the source code that gets converted with nanoc into output directory and the result is pushed into a `gh-pages` branch on the same repository.

So you have the following structure:

~~~
/Bonobo-Git-Server/             # folder pointed to master branch with sources
/Bonobo-Git-Server/output       # generated folder by nanoc that points to git gh-pages branch
~~~

## Installation

You need to have a ruby installed -- version 2.2.6. For Windows use [RubyInstaller](https://rubyinstaller.org/). For UNIX I recommend using [rbenv](https://github.com/rbenv/rbenv) and [ruby-build](https://github.com/rbenv/ruby-build).



After checking that ruby is installed and the version matches with `ruby -v` install [bundler](http://bundler.io/).

~~~
gem install bundler
~~~

Next thing is cloning the project and it's gh-pages branch.

~~~
git clone https://github.com/jakubgarfield/Bonobo-Git-Server-Web.git
cd Bonobo-Git-Server-Web
git clone --depth 1 https://github.com/jakubgarfield/Bonobo-Git-Server-Web.git -b "gh-pages" output
~~~

In ruby the dependencies are called ruby gems (stored in Gemfile) and installed with [bundler](http://bundler.io/). In the project directory run the following:

~~~
bundle install            # installs dependencies
bundle exec nanoc         # starts nanoc compilation
bundle exec nanoc view    # starts localhost:3000 server to check the result
~~~

Every time you make a change run `bundle exec nanoc` to compile it to the output and if you run `bundle exec nanoc view` (you can keep it running in another terminal window) you can browse `http://localhost:3000` to check the website.

## Publishing new version

* add the new zipped version to `content/resources/releases/`
* change `content/index.erb` to point to the new version
* update `content/changelog.md` to reflect the new release

After that you can run `. deploy.sh "Release X.X.X"` to publish the changes if you are on UNIX machine or publish to `gh-pages` branch manually.

~~~
# commit changes to master branch
git add .
git commit -m "Release X.X.X"
git push origin master

# compile the site and remove obsolete files
bundle exec nanoc
bundle exec nanoc prune --yes

# publish to github pages
cd output
git add .
git commit - m "Release X.X.X"
git push origin gh-pages
~~~
