# Akiva Levy's Dotfiles

Various hacks and tweaks I employ in my [work](http://sixthirteendesign.com) 
setup for *nix-based systems.

## Installation:

```bash
git clone git://github.com/akiva/dotfiles.git ~/
```

## Create symlinks for any of the tools you use:

```bash
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bash_profile ~/.bash_profile
ln -s ~/dotfiles/gitconfig ~/.git/config
ln -s ~/dotfiles/gitignore ~/.git/ignore
ln -s ~/dotfiles/ssh/config ~/.ssh/config
```

## Switch to the `~/dotfiles/vim` directory, and clone bundles:

```bash
cd ~/dotfiles/vim
./update_bundles
```

## Featured Vim bundles

I am currently using the following Vim bundles (via Pathogen):

* <git://github.com/tpope/vim-pathogen.git>
* <git://github.com/tpope/vim-fugitive.git>
* <git://github.com/henrik/vim-indexed-search.git>
* <git://github.com/othree/html5.vim.git>
* <git://github.com/plasticboy/vim-markdown.git>
* <git://github.com/timcharper/textile.vim.git>
* <git://github.com/tpope/vim-haml.git>
* <git://github.com/digitaltoad/vim-jade.git>
* <git://github.com/tpope/vim-rails.git>
* <git://github.com/tpope/vim-rvm.git>
* <git://github.com/tpope/vim-commentary.git>
* <git://github.com/tpope/vim-cucumber.git>
* <git://github.com/tpope/vim-surround.git>
* <git://github.com/tpope/vim-git.git>
* <git://github.com/tsaleh/vim-shoulda.git>
* <git://github.com/wavded/vim-stylus.git>
* <git://github.com/duskhacker/sweet-rspec-vim.git>
* <git://github.com/itspriddle/vim-jquery.git>
* <git://github.com/tsaleh/vim-align.git>
* <git://github.com/tsaleh/vim-supertab.git>
* <git://github.com/vim-scripts/browser.vim--Brown.git>
* <git://github.com/pangloss/vim-javascript.git>
* <git://github.com/tpope/vim-repeat.git>
* <git://github.com/wincent/Command-T.git>
* <git://github.com/scrooloose/nerdtree.git>
* <git://github.com/vim-ruby/vim-ruby.git>
* <git://github.com/leshill/vim-json.git>
* <git://github.com/tsaleh/vim-tcomment.git>
* <git://github.com/mattn/gist-vim.git>
* <git://github.com/msanders/snipmate.vim.git>
* <git://github.com/briancollins/vim-jst.git>
* <git://github.com/tpope/vim-vividchalk.git>

Suggestions and improvements are 
[welcome](https://github.com/akiva/dotfiles/issues)