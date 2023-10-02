# Installation guide

## _Prerequisites_

- zsh
- curl

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

## Install npm global packages

There are a few mandatory npm packages. Install them using this.

```bash
npm i -g @fsouza/prettierd eslint_d vscode-langservers-extracted
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

## One last thing

Remember, this is _highly opinionated_, so things might not work exactly how you expect. But, hey, that's half the fun, right?

## Contributing

If you think you can make this chaos even better, feel free to open an issue or submit a PR. Just remember, there's a fine line between genius and insanity. Are you up for the challenge?

Happy hacking!
