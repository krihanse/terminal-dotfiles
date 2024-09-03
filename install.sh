# install brew if you have sudo 
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# If sudo is not provided
mkdir -p ~/.local/Homebrew &&
curl -L https://github.com/Homebrew/brew/tarball/master |
tar xz --strip 1 -C ~/.local/Homebrew

mkdir -p ~/.local/bin &&
ln -s ~/.local/Homebrew/bin/brew ~/.local/bin

# Install zinit plugin manager
# https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#install
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"


# update brew
brew update

# install font-fira-code-nerd-font

brew install font-fira-code-nerd-font

# https://starship.rs/guide/#%F0%9F%9A%80-installation
brew install starship

# https://github.com/nvbn/thefuck?tab=readme-ov-file#installation
brew install thefuck

# https://github.com/tonsky/FiraCode/wiki/Installing
brew install --cask font-fira-code

# https://github.com/eza-community/eza/blob/main/INSTALL.md
brew install eza

# https://github.com/junegunn/fzf?tab=readme-ov-file#installationc
brew install fzf

# https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
brew install zoxide

# https://github.com/sharkdp/bat
brew install bat

# install kubectl
brew install kubectl

# install fluxcd
brew install flux

# install yq
brew install yq 

# install komposer
brew install komposer

# install kubeconform
brew install kubeconform

# install neovim
brew install neovim

# install helm
brew install helm

# install stow
brew install stow

# install kubie
brew install kubie

# https://www.jetify.com/devbox/docs/installing_devbox/
# curl -fsSL https://get.jetify.com/devbox | bash

# install neovim
#curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
#sudo rm -rf /opt/nvim
#tar -C ~/.local/bin -xzf nvim-linux64.tar.gz
