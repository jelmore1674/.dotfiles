# Installation guide

## _Prerequisites_

-   zsh
-   curl

## Install on-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Clone dotfile repo

The next step is to clone the repo

## Install Brewfile

`cd` into the `.dotfiles` directory and install the `Brewfile`

```bash
brew bundle install --file Brewfile
```

## Stow

Once the `Brewfile` is installed, stow the directories in the root.

First, stow nvim config.

```bash
stow nvim
```

Then stow either the work or personal configuration.

```bash
stow personal
```

## Configure iTerm

**_Important_**

Install the font in the repo, to do this, just run the following command from the dotfiles directory.

```bash
open iterm
```

## Login to 1Password

Using the `1Password` cli, sign in.

```bash
op account add
```

Once the account is setup, run get the key by running.

```bash
op document get "key" --output ~/secrety.key
```

## Decrypt Repo

To decrypt the repo after getting the key, run the following command

```bash
git-crypt unlock ~/secrety.key
```