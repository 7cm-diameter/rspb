# Below commented out lines must be run before execute `init.sh`.
# sudo apt update && sudo apt upgrade -y
# sudo apt install git -y
# git clone [https://github.com/7cm-diameter/rspb] ~/.rspb
# cd .rspb && sh raspberry-pi_setup.sh
# You also download `Hack Nerd-fonts` from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack.
# Downloaded patches must be in `$HOME/.local/share/fonts`.

sudo snap install neovim --classic
sudo snap install chezmoi --classic
sudo apt install -y fish fzf build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev nodejs npm portaudio19-dev cmake

# Enter fish.
fish

# Install python and other utilities for python.
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
set -Ux $PYENV_ROOT/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv install 3.10.12
pyenv global 3.10.12
curl -sSL https://install.python-poetry.org | python3 -
fish_add_path $HOME/.local/bin
poetry config virtualenvs.in-project true

# Install cargo and install binaries through cargo.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
set -Ux $RUST_ROOT $HOME/.cargo
fish_add_path $RUST_ROOT/bin
cargo install exa fd-find ripgrep starship

# Install arduino-cli and other dependecies for `pino`.
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=~/.local/bin sh
arduino-cli core install arduino:avr
arduino-cli lib install servo
sudo usermod -a -G dialout $USER

# Install nodejs
sudo npm -g install n
sudo n stable
sudo apt purge nodejs npm
sudo apt autotemove -y
sudo npm -g install yarn

# Apply config
chezmoi init https://github.com/7cm-diameter/dotfiles
chezmoi apply

sudo chsh -s /usr/bin/fish
