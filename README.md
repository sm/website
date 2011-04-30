# Developing BDSM WebSite

## Bash Delectable Scripting Modules (BDSM) Framework Documentation WebSite

You can see the documentation live online at http://bdsm.beginrescueend.com/.
Get the Site Running Locally

If you're going to help you'll first need to get the site running locally.
Start by forking the repository and cloning the fork.

## Requirements

The site requires that you have ruby 1.9.2 running in your environment.
(Although you can manually use something else, this is what is setup in the
file currently.)

You can do this with RVM (be sure to read both the installation and basics
documentation for RVM) by typing the following at the command line:

    rvm install 1.9.2

The bdsm-site project requires a few ruby gems that can be found in the
bdsm-site.gems, including:

* [compass](http://compass-style.org/) - Helps with managing haml/sass
* [haml](http://haml-lang.com/) - The markup language used for authoring
pages concisely.
* [sass](http://sass-lang.com/) - Used for generating css. (bundled with the haml Gem)
* [nanoc3](http://nanoc.stoneship.org/) - Used for generating the static
website.
* [rack](http://guides.rubyonrails.org/rails_on_rack.html) - Used for
developing the website and viewing locally with nanoc autocompile feature.
* [mime-type](http://rubyforge.org/projects/mime-types/) - Used for
development with nanoc autocompile feature.

The cloned site will detect if you have these installed (except Mime-type) in
your current ruby and if not it will install them in RVM for you.

## Getting the site Running

First be sure that you have ruby 1.9.2 selected and are in the cloned repository
directory.

Note that if you cd to the directory and are using RVM, the project .rvmrc
will be loaded and you can open the content/ in your editor and start hacking
away on the website.

If you would like to view the changes locally as you hack, You can use Nanoc's
AutoCompile feature:

    nanoc3 aco

Then visit http://localhost:3000/ if you are on OSX you can do this from the command line,

    open http://localhost:3000/

On some linux systems you can do the following,

    xdg-open http://localhost:3000/

## Submitting Website/Documentation Updates

Once you are satisfied with your changes to the documentation push them to your
github fork *on a branch* and initiate a pull request. Please use a topic branch.
Sample submission workflow is below.

First fork the repository on github into your account.

Next add your github as a remote and checkout a topic branch.

    user$ githubuser={{your github user name}}
    user$ p bdsm site # cd into the bdsm website
    user$ git remote add github git@github.com:$githubuser/bdsm-site.git
    user$ branch=update_for_{{name the branch something useful, no spaces}}
    user$ git checkout -b $branch
    user$ git add {{the files you added or changed}}

Now say what you did, be clear and consise

    user$ git commit -m "Updated the documentation with ..."
    user$ git push github $branch

Now browse to your github account's bdsm-site repository and issue a pull request to the main bdsm-site repository. On OSX you can do this from the command line,

    user$ open https://github.com/$githubuser/bdsm-site/tree/$branch

On some linux systems you can do this,

    user$ xdg-open https://github.com/$githubuser/bdsm-site/tree/$branch

It is advised to leave a message for me (wayneeseguin) in #beginrescueend on irc.freenode.net regarding the pull request and/or discuss your updates with me there. I am very happy to work with you to get your updates incorporated quickly.

## Thank YOU

Thank you very much for taking the time to work on the BDSM website!!!
I truly appreciate it!

  ~Wayne

