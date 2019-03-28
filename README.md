# My dotfiles

This depository contains all my configuration files to setup a new machine.
It is powered by [dotbot](https://github.com/anishathalye/dotbot).

## Installation requirements

All of these configuration files are useless without installing the following
items. Installation methods can differ in function of the programs and the
environment, therefore I do not provide a generic installation script but I 
rather give a list of things to install manually.

**APT packages:**

* [tmux](apt://tmux)
* [vim](apt://vim) 
* [zsh](apt://zsh)

**Manual installations:**

* [pip](https://pip.pypa.io/en/stable/installing/)

**Python packages:**

* [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/install.html)
* [pylint](https://pylint.readthedocs.io/en/stable/user_guide/installation.html)
* [pudb](https://github.com/inducer/pudb)

## Local changes

* To make local changes to `.zshrc`, create the file `$home/.zshrc.local`
  and write your configuration in it. It is sourced at the end of the `.zshrc`.
