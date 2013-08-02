#!/bin/sh

echo "Installing dotfiles"
echo "==================="

echo "$(tput setaf 7)Phase 0 - Clone pingviini's mydotfiles repo$(tput setaf 9)"
echo "-------------------------------------------"
echo " * Running git clone git://github.com/pingviini/mydotfiles $HOME/.mydotfiles"

if [ ! -d $HOME/.mydotfiles ]; then
    git clone -q git@github.com:pingviini/mydotfiles.git $HOME/.mydotfiles
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

if [ ! -d $HOME/.vim ]; then
    echo " * symlinking vim to $HOME/.vim"
    ln -s $HOME/.mydotfiles/vim $HOME/.vim
    echo " $(tput setaf 2)* symlink ready$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .vim from $HOME.$(tput setaf 9)"
fi

if [ ! -f $HOME/.vimrc ]; then
    echo " * symlinking vimrc to $HOME/.vimrc"
    ln -s $HOME/.vim/vimrc $HOME/.vimrc
    echo " $(tput setaf 2)* symlink ready$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .vimrc from $HOME.$(tput setaf 9)"
fi

if [ ! -f $HOME/.gvimrc ]; then
    echo " * symlinking gvimrc to $HOME/.gvimrc"
    ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
    echo " $(tput setaf 2)* symlink ready.$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .gvimrc from $HOME.$(tput setaf 9)"
fi

if [ ! -f $HOME/.pdbrc ]; then
    echo " * symlinking pdbrc to $HOME/.pdbrc"
    ln -s $HOME/.python/pdbrc $HOME/.pdbrc
    echo " $(tput setaf 2)* symlink ready.$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .pdbrc from $HOME.$(tput setaf 9)"
fi

echo "$(tput setaf 7)Phase 4 - Zsh & oh-my-zsh.$(tput setaf 9)"
echo "-------------"
echo " * Updating oh-my-zsh..."
cd $HOME/.mydotfiles
git submodule update --init ./zsh/oh-my-zsh
echo " $(tput setaf 2)* Oh-my-zsh updated.$(tput setaf 9)"
if [ ! -f $HOME/.zshrc ]; then
    echo " * symlinking zshrc.zsh-template to $HOME/.zshrc"
    ln -s $HOME/.mydotfiles/zsh/oh-my-zsh/zshrc.zsh-template $HOME/.zshrc
    echo " $(tput setaf 2)* symlink ready$(tput setaf 9)"
else
    echo " $(tput setaf 3)* found .zshrc from $HOME.$(tput setaf 9)"
fi
