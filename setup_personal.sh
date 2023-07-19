#! /bin/zsh

echo "Starting setup"

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files=gitconfig,zshrc    # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"



# Install Oh My ZSH
if [ -d ~/.oh-my-zsh ]
then
   echo "oh-my-zsh is installed"
else
   echo "Installing oh-my-zsh"
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install other tools neded
# TODO

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
    echo "Clearn old files"
     mv ~/.gitconfig $olddir/.gitconfig
     mv ~/.zshrc $olddir/.zshrc
     mv ~/.ssh $olddir/.ssh
     mv ~/.tauri $olddir/.tauri
    echo "link files"
    ln -s $dir/personal/.gitconfig ~/.gitconfig
    ln -s $dir/personal/.zshrc ~/.zshrc
    ln -s $dir/personal/.ssh ~/.ssh
    ln -s $dir/personal/.tauri ~/.tauri
