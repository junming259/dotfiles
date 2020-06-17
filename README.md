__Dotbot for managing dotfiles__
===

### Dotbot
Dotbot makes installing your dotfiles easily. Dotbot is a tool that bootstraps
your dotfiles (it's a [Dot]files [bo]o[t]strapper, get it?). It does less than
you think, because version control systems do more than you think.

Dotbot is designed to be lightweight and self-contained, with no external dependencies
and no installation required. Dotbot can also be a drop-in replacement for any other
tool you were using to manage your dotfiles, and Dotbot is VCS-agnostic -- it
doesn't make any attempt to manage your dotfiles.


### Installation
If you're using Git, you can add Dotbot as a submodule [details](https://github.com/anishathalye/dotbot/tree/f5e019105ec5a70a71d5afa78dc44baa0e87b721#integrate-with-existing-dotfiles). Here I prefer install Dotbot from PyPI and call it as a command-line
program
```shell
pip3 install dotbot --user
touch install.conf.yaml
```
Note dotbot in this case will be installed in `~/.local/bin/`, add it to `$PATH`
by one-time solution:
```shell
export PATH="$HOME/.local/bin:$PATH"
```
or add it to `.bashrc` or `.zshrc`


### Install dotfiles
