# Awesome Dotfiles

Simple, but extensive customization of ZSH, TMUX, and Vim.

This is a forked branch of [Parth/dotfiles](https://github.com/Parth/dotfiles).
This contains my personal vimrc config and some other stuffs that I modified to suit my personal preferences

[![VideoWalkthrough](https://img.youtube.com/vi/UgDz_9i2nwc/0.jpg)](https://www.youtube.com/watch?v=UgDz_9i2nwc)

#### This is how my terminal looks like
![alt
text](https://github.com/justinethomas009/dotfiles/blob/master/terminal_settings/my_term_setup.png "This how my setup looks like")

## Setup Options

There's 3 ways in which you can use this, depending on how much you think you'll be customizing.

But I strongly suggest that you fork this repo when it's stable and then clone this into your system, as some of the changes I do may cause your terminal to break.

One of the key features is that this implementation stays in sync across all your machines.
So depending on how much you'd like to customize your configuration, you have a few options:

* Little Customization: Just clone this repo and jump to [Installation](#installation).
* Mild Customization: [Fork]() this repo, and clone your own fork.
Keep an eye on this repo for bugfixes and other improvements that you'd like to incorporate into your fork.
Then jump to [Installation](#installation).
* Most Customization: Building your own dotfiles from scratch!
Read through these docs, watch the video above, star this repo, and create your own dotfiles!
You can add this repository as a [git module](https://git-scm.com/book/en/v2/Git-Tools-Submodules) and source the parts you like.

If you're unsure, just read the docs, watch the video, clone this repository, and jump to [Installation](#installation).

## Installation

Once the repo is cloned, execute the deploy script:
```
./deploy
```

This script guides you through the following:

1. Checks to see if you have zsh, tmux, and vim installed.
2. Installs it using your default package manager if you don't have it installed.
3. Checks to see if your default shell is zsh.
4. Sets zsh to your default shell.
5. Backs up your old configuration files.
6. Installs silver searcher for searching(it's faster than grep)

Pretty convenient for configuring new servers.

# Sumary of Changes

## Basic runtime opperations

All default dotfiles (`.zshrc`, `.vimrc`, etc) source something within the dotfiles repository.
This helps separate changes that are synced across all your machines with system specific changes.

Upon launching a new shell, the first thing that's evaulated is `zshrc_manager.sh`. This script first launches tmux.
Then once zsh logs in, within tmux, it updates the dotfiles repository, and sources the changes.

## [Zsh](https://en.wikipedia.org/wiki/Z_shell)

* `cd` has been reassigned to `cd` and `ls`. Every time you navigate to a new directory, it will display the contents of that directory.

### Prompt

The Prompt which I am using is Powerlevel9k which works on my Mac, but for some reason it was not working in my Ubuntu Virtual Machine. So on Linux the shell defaults to this custom Prompt.

But the zshrc.sh has all my settings in it so you can work on it yourself. Anyway both Powerlevel9K and the custom prompt gives almost the same information like time to execute etc.

The prompt takes on the form:

```
[plugin, plugin, ...]:
```

Each plugin is sensitive to where you are and what you're doing, they reveal themselves when it's contextually relevant. Plugins include:

* `PWD plugin`: always present, tells you where you are. Always the first plugin.
* `Status code plugin`: appears anytime a program returns with a non-zero status code. Tells you what status code the program completed with.
* `Git plugin`: appears when you're in a git repository. Tells you what branch you're on, and how many files have been changed since the last commit.
* `Sudo plugin`: tells you when you can sudo without a password. Or when you're logged in as root.
* `Time plugin`: appears when a program took more than 1s to execute. Tells you how long it took to execute.
* `PID plugin`: appears when you background a task. Tells you what the PID of the task is.

### Keybindings
| Key Stroke | What It Does |
|------------|--------------|
| Ctrl-G     | Runs ``git add -A; git commit -v && git push`` |

### Plugins

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Searches your history while you type and provides suggestions.
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/ad522a091429ba180c930f84b2a023b40de4dbcc): Provides fish style syntax highlighting for zsh.
* [ohmyzsh](https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3): Borrowed things like tab completion, fixing ls, tmux's vi-mode plugin.
* [vimode-zsh](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode) allows you to hit `esc` and navigate the current buffer using vim movement keys.
* There is a `script` folder where you can copy paste custom shell scripts to
  use it directly from the terminal. No more typing the full path of your
  custom script. Just make sure the scripts have executable permissions. You
  can do that by `sudo chmod 755 filename`

## [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor))

* I use `Vundle` for all my plugin installation. And the `deploy` script would
  have already installed all the plugins. You are free to modify the
  `plugins.vim` file in the folder and comment out the plugins you don't want to
  install beforehand, that way Vundle won't download it in the first place.
* The vim folder also has a `en.utf-8.add` file which will be your custom
  dictionary.

### Vim custom Keybindings
| Key Stroke | What It Does |
|------------|--------------|
| `<leader>g   `  | YCM goto defination or declaration |
| `<leader>r   `  | Show interactively what you are searching to replace |
| `<leader>u   `  | Toggle undo tree |
| `<leader>T   `  | Use Command-T for searching |
| `<leader>t   `  | Toggle tagbar |
| `<leader>s   `  | Use Ag(the silver searcher) to search for a pattern in your directory |
| `<leader>e   `  | Edit your vimrc.vim file in dotfiles |
| `<leader>bt  `   | Toggle buffer explorer |
| `Ctrl-<space>`   | To do snippet expansion  |

`<leader>` is mapped to `,`

## [Tmux](https://en.wikipedia.org/wiki/Tmux)

* Ctrl-B has been remapped to the backtick character (&#96;). If you want to type the actual backtick character (&#96;) itself, just hit the key twice.
* `%` has been remapped to `v`.
* Use vim movement keys for moving between panes.
* Copy buffer is copied to xclip.
* Status bar tells you date, time, user, and hostname. Especially useful with nested ssh sessions.
* Execute `split_panes` in your shell to split your window into 4 panes. This
  is the way I like to use

## Fonts

* The `fonts` folder has my preferred font in it which is already patched for
  powerline.

## Terminal Settings

* The `terminal_settings` folder contains my color scheme and my custom
  background image(it's actually my name. I wrote on a piece of paper and did
  some photoshop)

## Uninstall

* There is `uninstall` script in the folder. You can use it to uninstall the
  setup. But you may have to dive inside it to make it work for yourselves.
* It is not tested.
* It actually works like this
1. First when you use the `deploy`
  script it makes a file `.changes` in your home directory which contains all
  the changes the `deploy` is making and it also appends `-old` to your current config
  files.
2. That way all your settings are maintained. And when you want to
  uninstall the setup the `uninstall` script first checks for the `.changes`
  and uninstall all the programs which have `not_installed` against it.
  It's saying that a particular program was not installed before running
  the `deploy` script so you have to uninstall it.
3. After that then the script checks for files with `-old` in it and it
  renames it back.
4. After the script ends then you are free to delete the `dotfiles` folder.
