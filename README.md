# Akiva Levy's Dotfiles

An extremely extensive set of dotfiles, annotated for a clear understanding,
that I use for my [work](http://sixthirteendesign.com). This includes Web
development, UI design, and server administration for \*nix-based systems
(including OS X).

Clearly the best dotfiles collection out there... For me, at least ^\_^

## Package Installation

```bash
git clone git://github.com/akiva/dotfiles.git ~/
```

## Creating symlinks for any of the tools you wish to use

### Vim

```bash
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim/ ~/.vim
ln -s ~/dotfiles/gvimrc ~/.gvimrc
```

Note: be aware that I am using Vim 7.3.x, which adds some new options and as
such, my .vimrc reflects this. If you are using a lower version, you really
ought to consider upgrading.

### BASH

```bash
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bash_profile ~/.bash_profile
```

### Git

```bash
ln -s ~/dotfiles/gitconfig ~/.git/config
ln -s ~/dotfiles/gitignore ~/.git/ignore
```

### SSH

```bash
ln -s ~/dotfiles/ssh/config ~/.ssh/config
```

### TODO.SH

If you use [todo.sh](https://github.com/ginatrapani/todo.txt-cli) as I do,
it can be convenient to use my setup to include your config file as so:

```bash
ln -s ~/dotfiles/todo.cfg ~/.todo.cfg
```

## Get Vim bundle submodules

In order to ensure your submodules are up-to-date, I prefer adding each bundle
as a submodule, rather than including cloned bundles as many do.

After cloning this repo, simply issue the following:

```bash
cd ~/dotfiles
git submodule update --init
```

## Keeping submodules up-to-date

In order to update your precious submodules automatically, do:

```bash
cd ~/dotfiles
git submodule foreach git pull
```

Suggestions and improvements are
[welcome](https://github.com/akiva/dotfiles/issues)
