#!/bin/sh

echo "Installing dotfiles"
echo "==================="

echo "$(tput setaf 7)Phase 0 - Clone pingviini's mydotfiles repo$(tput setaf 9)"
echo "-------------------------------------------"
echo " * Running git clone git://github.com/pingviini/mydotfiles $HOME/.mydotfiles"

if [ ! -d $HOME/.mydotfiles ]; then
    git clone -q git://github.com/pingviini/mydotfiles $HOME/.mydotfiles
    echo " $(tput setaf 2)* repository cloned$(tput setaf 9)"
else
    echo " $(tput setaf 1)* There is .mydotfiles folder already in $HOME."
    echo " * Panic! Quit."
    exit 1;
fi

echo "$(tput setaf 7)Phase 1 - Mercurial$(tput setaf 9)"
echo "-------------------"

if [ ! -f $HOME/.hgrc ]; then
    echo " * symlinking hgrc to $HOME/.hgrc"
    ln -s $HOME/.mydotfiles/mercurial/hgrc $HOME/.hgrc
    echo " $(tput setaf 2)* symlink ready$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .hgrc from $HOME.$(tput setaf 9)"
fi

if [ ! -f $HOME/.hgignore ]; then
    echo " * symlinking hgignore to $HOME/.hgignore"
    ln -s $HOME/.mydotfiles/mercurial/hgignore $HOME/.hgignore
    echo " $(tput setaf 2)* symlink ready.$(tput setaf 9)\n"
else
    echo " $(tput setaf 3)* found .hgignore from $HOME.$(tput setaf 9)"
fi

echo "$(tput setaf 7)Phase 2 - Git$(tput setaf 9)"
echo "-------------"

if [ ! -f $HOME/.gitconfig ]; then
    echo " * symlinking gitconfig to $HOME/.gitconfig"
    ln -s $HOME/.mydotfiles/git/gitconfig $HOME/.gitconfig
    echo " $(tput setaf 2)* symlink ready$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .gitconfig from $HOME.$(tput setaf 9)"
fi

if [ ! -f $HOME/.gitignore ]; then
    echo " * symlinking gitignore to $HOME/.gitignore"
    ln -s $HOME/.mydotfiles/git/gitignore $HOME/.gitignore
    echo " $(tput setaf 2)* symlink ready.$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .gitignore from $HOME.$(tput setaf 9)"
fi

echo "$(tput setaf 7)Phase 3 - Vim$(tput setaf 9)"
echo "-------------"

if [ ! -f $HOME/.vimrc ]; then
    echo " * symlinking vimrc to $HOME/.vimrc"
    ln -s $HOME/.mydotfiles/vim/vimrc $HOME/.vimrc
    echo " $(tput setaf 2)* symlink ready$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .vimrc from $HOME.$(tput setaf 9)"
fi

if [ ! -f $HOME/.gvimrc ]; then
    echo " * symlinking gvimrc to $HOME/.gvimrc"
    ln -s $HOME/.mydotfiles/vim/gvimrc $HOME/.gvimrc
    echo " $(tput setaf 2)* symlink ready.$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .gvimrc from $HOME.$(tput setaf 9)"
fi

echo " * Updating vim bundles..."
cd $HOME/.mydotfiles
git submodule foreach git submodule init
git submodule foreach git submodule update
echo " * Vim bundles updated."
