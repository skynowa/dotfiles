# Akiva Levy's Dotfiles

An extensive set of dotfiles, annotated for a clear understanding, that I use
for my [work](http://sixthirteendesign.com). This includes Web
development, UI design, and server administration for \*nix-based systems
(including the dastardly Mac OS X). Unlike many other dotfile collections, I
tend to be conservative with regards to many things, such as BASH aliases, etc.
opting for a more pragmatic approach, arguing that not every command possible
requires a three letter shortcut (far beyond the abilities of any human).

Clearly the best dotfile collection out there. ^\_^

## Requirements

These dotfiles rely on Git for Vim plugins via submodules. As such, Git is more or
less a requirement. It is possible to install these dotfiles without the use of
Git, however. See the installation instructions below for details.

N.B. Various BASH aliases and functions related to Git are defined. Rather than
performing installation checks, I make the assumption that anyone using this
feature is using Git (if there are enough requests to change this behaviour, I
may reconsider my position).

## Package Installation

### Using Git

To install these files using Git, you can simply clone this repository in the
directory of your choosing (I favour `~/dotfiles`). As such, you can execute
the following command:

`
git clone git://github.com/akiva/dotfiles.git ~/
`

### Sans Git

If you would prefer to install without relying on a Git clone, you can execute
the following:

`
curl -#L https://github.com/akiva/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude=README.md
`

However, this method will not include any Git submodules included within the
package, such as my Vim bundles.

## Creating `Symlink`s for Desired Dotfiles

### Vim

`
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim/ ~/.vim
`

Note: be aware that I am using Vim 7.3.x, which adds some new options and as
such, my `.vimrc` reflects this. If you are using a lower version, you really
ought to consider upgrading. Additionally, I prefer to store all Vim-related
settings directly in my `.vimrc` using guards for GUI, etc. rather than
employing the somewhat extraneous `.gvimrc` file.

### BASH

You can symlink my BASH files completely, using the following statement:

`
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bash_profile ~/.bash_profile
`

If you would like to overwrite some of the settings included with your own
preferences, you can include them in a `.local-bashrc` file, which will be
loaded automatically within the `.bash_profile` after the `.bash_rc` is
included (thus, overriding said preferences).

### Git

Since my Git config file is set up to include my name and e-mail address, this
is best left _not_ symlinked, but rather copied over. The same may be done with
the basic gitignore file (although, it could be symlinked, if desired).

`
cp ~/dotfiles/gitconfig ~/.git/config
cp ~/dotfiles/gitignore ~/.git/ignore
`

The main advantage here is that you can then alter these to suit your fancy
without messing around with the Git repo itself.

### SSH

The included config file should be copied and not symlinked for the very same
reasons listed above (as it acts as a template):

`
cp ~/dotfiles/ssh/config ~/.ssh/config
`

### TODO.SH

If you use [todo.sh](https://github.com/ginatrapani/todo.txt-cli) as I do,
it can be convenient to use my configuration file, which moves all related
files to `~/Dropbox/todo/` for synchronisation purposes.

`
ln -s ~/dotfiles/todo.cfg ~/.todo.cfg
`

### Mac OS X Defaults

If you are using _Darwin_, the Mac OS X operating system, and wish to set your
environment to match those of my Mac OS X system, perform the following:

`
./dotfiles/osx-defaults.sh
`

N.B. This action may require changing the permissions to this file. If so,
simply `chmod` it as follows:

`
chmod u+x ~/dotfiles/osx
`

## Get Vim Bundle Submodules

In order to ensure all submodules are up-to-date, I prefer adding each bundle
as a Git submodule, rather than including cloned bundles as static resources
(as many dotfile collections tend to).

After cloning this repo, simply issue the following command (assuming you are
using the same directory preferences as I have mentioned above, if not, modify
accordingly):

`
cd ~/dotfiles
git submodule update --init
`

## Keeping Submodules Up-to-Date

In order to update all those precious submodules easily, do the following:

`
cd ~/dotfiles
git submodule foreach git pull
`

---

# TODO

The following are some features I plan on including within these dotfiles.

## BASH

- Include Linux equivalents for:
    - Trim new lines and copy to clipboard
    - Flush DNS cache
    - Empty trash
    - Move file to trash
- Include BASH theme
- Setup VCPrompt installation http://vcprompt.com/
- BASH-help function to output all aliases and functions, along with a basic
  description of usage
- Colourise CLI output

## OSX Defaults

- Removing Spotlight icon in menu bar, since I prefer Alfred

## Other Files Coming Soon

- `.gemrc`
- `.aprc`
- `.inputrc`
- `.screenrc`
- `.irbrc`
- `.pryrc`

---

Suggestions and improvements are
[welcome](https://github.com/akiva/dotfiles/issues)
