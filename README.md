# My dotfiles 


## Dotbot
I use [Dotbot](https://github.com/anishathalye/dotbot) for managing dotfiles,
since Dotbot makes installing dotfiles easily. Dotbot is a tool that bootstraps
your dotfiles (it's a [Dot]files [bo]o[t]strapper). It does less than you think,
because version control systems do more than you think.

Dotbot is designed to be lightweight and self-contained, with no external
dependencies and no installation required. Dotbot can also be a drop-in
replacement for any other tool you were using to manage your dotfiles, and
Dotbot is VCS-agnostic -- it doesn't make any attempt to manage your dotfiles.


## Installation
If you're using Git, you can add Dotbot as a submodule 
[details](.https://github.com/anishathalye/dotbot#integrate-with-existing-dotfiles).
Here I prefer install Dotbot from PyPI and call it as a command-line program.
```shell
pip3 install dotbot --user
touch install.conf.yaml
```

Note dotbot in this case will be installed in `~/.local/bin/`, add it to `$PATH`
by one-time solution:
```shell
export PATH="$HOME/.local/bin:$PATH"
```
or add it to `.bashrc` or `.zshrc`. Then you can invoke Dotbot with:
```shell
dotbot -c <path to configuration file>
```

## Vim Plugins Installation
[vim-plug](https://github.com/junegunn/vim-plug), a vim plugin manager is used
to manage plugins for vim. Plugins can be automatically installed by sourcing
`~/.vimrc` and `:PlugInstall` to install plugins. Basics of vim-plug can be
found [here](https://github.com/junegunn/vim-plug/wiki/tutorial).


## Configuration
Details for creating configuration files can be found 
[here](https://github.com/anishathalye/dotbot/tree/f5e019105ec5a70a71d5afa78dc44baa0e87b721#configuration)
