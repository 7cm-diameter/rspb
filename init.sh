# Below commented out lines must be run before execute `init.sh`.
# sudo apt update && sudo apt upgrade -y
# sudo apt install git -y
# git clone https://github.com/7cm-diameter/rspb ~/.rspb
# cd .rspb && sh init.sh
# You also download `Hack Nerd-fonts` from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack.
# Downloaded patches must be in `$HOME/.local/share/fonts`.

sudo snap install neovim --classic
sudo snap install chezmoi --classic
sudo apt install -y fish fzf build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev nodejs npm portaudio19-dev cmake

# Install python and other utilities for python.
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv 
fish -c "set -Ux PYENV_ROOT $HOME/.pyenv "
fish -c "fish_add_path $PYENV_ROOT/bin"
fish -c "pyenv install 3.10.12"
fish -c "pyenv global 3.10.12"
fish -c "curl -sSL https://install.python-poetry.org | python3 -"
fish -c "fish_add_path $HOME/.local/bin"
fish -c "poetry config virtualenvs.in-project true"

# Install cargo and install binaries through cargo.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fish -c "set -Ux RUST_ROOT $HOME/.cargo"
fish -c "fish_add_path $RUST_ROOT/bin"
fish -c "cargo install exa fd-find ripgrep starship alacritty"

# Install arduino-cli and other dependecies for `pino`.
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=~/.local/bin sh
fish -c "arduino-cli core install arduino:avr"
fish -c "arduino-cli lib install servo"
fish -c "sudo usermod -a -G dialout $USER"

# Install nodejs
sudo npm -g install n
sudo n stable
sudo apt purge nodejs npm
sudo apt autotremove -y
sudo npm -g install yarn

# Apply config
chezmoi init https://github.com/7cm-diameter/dotfiles
chezmoi apply

sudo chsh -s /usr/bin/fish
