# My dotfiles for Ubuntu
## Set Up Instructions
- Clone this repository to `~/.dotfiles`
- Ensure Required Installations are done by executing `./initial_setup.sh` from scripts folder
- Execute `~/.dotfiles/install.sh`
- Execute `./additional_setup.sh` from scripts folder to update `.bashrc`
- Optionally you may wish to update latest fonts from Nerd Font repository

## Individual Links
- Linker script takes 3 arguments, type of link as `soft/hard`, linking file/folder & destination file/folder
`./linker.sh -t soft -l ~/.dotfiles/.gitconfig -d ~/.gitconfig`

