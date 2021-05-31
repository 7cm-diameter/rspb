sudo pacman -Syyu
sudo pacman -S yay arduino arduino-avr-core
yay -S fd ripgrep starship exa fzf fish neovim pyenv poetry nodejs npm cheese
sudo npm install n -g
sudo n stable
yay -Rs nodejs npm
sudo pacman -S --needed base-devel openssl zlib xz
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh
pyenv install 3.7.10
poetry config virtualenvs.in-project true
sudo usermod -aG uucp $USER
git clone https://github.com/arduino-libraries/Servo ~/Arduino/libraries/Servo
