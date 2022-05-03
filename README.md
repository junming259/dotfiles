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
`~/.vimrc` and `:PlugInstall` to install plugins, `:PlugClean` to uninstall
plugins. Basics of vim-plug can be found [here](https://github.com/junegunn/vim-plug/wiki/tutorial).

### cheat sheet
- `:Gstatus` or `Git`: check the git status. 
    - `s`: stage changes.
    - `u`: unstage changes.
    - `dd` or `D` or `dv`: show diff between last commit.
    - `:diffoff` or `dq`: close diff pattern.
    - `<c-w><c-o>`: make this window the only window.
    - `X`: discard changes.
    - `P`: stage patch code.
- `:Git commit`: commit changescommit changes.
- `:Git push`: push commits.
- `:Git checkout branch` or `Git switch branch`: switch branch.
- `:Git lg`: show log graph.
- `:Gedit`: go back the current version of code.
- `:Gedit branch:%`: open the code in another branch
- `:Gclog`: check the commit objects.
- `:0Gclog`: check reversions of commits. 
    - `[q` and `]q`: navigation within quickfix.
- `:resize 20` or `:vertical resize 50`: to resize the split in vim.
- `<c-w>=`: split window equally.
- `ma`: add local mark `a`.
- `'a`: go to the mark `a`.
- `:marks`: list all marks.
- `:delm`: delete all local marks.
- `:pc`: close preview window.
- `:wa`: save all open buffers.


Git merge workflow in vim [ref](http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/):
- `:Git switch target_branch`: switch to the targe branch
- `:Git merge merge_branch`: merge the merge branch to targe branch
- `:Gvdiffsplit!` or `:G` and `dv`: open the three-way diff [target, copy, merge]
    - `:diffget //2` or `<leader> gh`: keep the block of code on the left (target).
    - `:diffget //3` or `<leader> gl`: keep the block of code on the right (merge).
    - `:Gwrite!`: keep the wholesale code.


Compare diff workflow:
- `:0Gclog`: show history
- `:[q` and `]q`: move between versions
- `:Gdiff`: open `diff` comparing the version with current one. `[c` and `]c` to navigate between changes.
- `:Gedit`: return to current copy

Search and replace workflow:
- `<c-p>`: seach files.
- `/cat`: search `cat` in the current file.
- `:%s/cat/dog/gc`: search `cat` and replace with `dog` in the whole file.
- `:Ag`: show grepping results of Ag across files in a floating window. 
- `<leader>ag`: show grepping results of Ag in quickfix, which is useful when
  seaching and replacing. Navigation by `[q` or `]q`


Compare diff on two files:
- Compare two files: open one of files; `Gdiff other_files`
- Compare files with another branch: `Gdiff branch_name`
- Compare with files in another branch: `Gdiff branch_name:path/dir/filename`. `Gdiff branch_name:%` if the same file.
- Compare with files that are not tracked by git: `vimdiff file1 file2`


Discard changes for unstage files:
- Discard all changes: `Git restore filename` or `Git checkout -- .`, `--` removes 
[argument ambiguation](https://git-scm.com/docs/git-checkout#_argument_disambiguation)
- Discard changes in a certain file: `Git checkout -- filename`


Revert files to previous vision:
- Revert all tracked files: `Git checkout commit_name`
- Revert certain files: `Git checkout master~2 filename`


Remove files from repository history:
- Reference [1](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/removing-sensitive-data-from-a-repository)
- Reference [2](https://dalibornasevic.com/posts/2-permanently-remove-files-and-folders-from-a-git-repository)
- Reference [3](https://github.com/18F/C2/issues/439)
```shell
git filter-branch --force --index-filter \
    "git rm --cached --ignore-unmatch PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA" \
    --prune-empty --tag-name-filter cat -- --all

git push origin --force --all
git push origin --force --tags
```

## Configuration
Details for creating configuration files can be found 
[here](https://github.com/anishathalye/dotbot/tree/f5e019105ec5a70a71d5afa78dc44baa0e87b721#configuration)
