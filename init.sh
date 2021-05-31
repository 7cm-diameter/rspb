sudo pacman -Syyu --noconfirm
sudo pacman -S yay arduino arduino-avr-core cheese barrier --noconfirm
sudo pacman -S --needed base-devel openssl zlib xz --noconfirm
yay -S fd ripgrep starship exa fzf fish neovim pyenv poetry nodejs npm --noconfirm
sudo npm install n -g
sudo n stable
yay -Rs nodejs npm --noconfirm
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh
pyenv install 3.7.10
poetry config virtualenvs.in-project true
arduino --version
sudo usermod -aG uucp $USER
git clone https://github.com/arduino-libraries/Servo ~/Arduino/libraries/Servo
