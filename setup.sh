#!/bin/sh

# Actualizaciones
echo "Actualizando"
sudo apt-get update
sudo apt-get -y upgrade

# Se instala git
echo "Instalando GIT"
sudo apt-get -y install git

# Instalacion snapd
echo "Instalando snapd"
sudo apt-get install -y snapd

# Se instala ZSH y Oh My ZSH
echo "Se instala ZSH"
sudo apt-get -y install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/donreno/donreno-linux-setup-basics/master/renito-agnoster.zsh-theme
mv renito-agnoster.zsh-theme ~/.oh-my-zsh/themes/
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="renito-agnoster"/g' ~/.zshrc

# Se instala SDK MAN
echo "Instalando SDK"
curl -s "https://get.sdkman.io" | bash
echo "SDK instalado"

# Instalando GraalVM
echo "Instalando GraalVM"
echo "Habilitando SDK"
source ~/.sdkman/bin/sdkman-init.sh
echo "Inicia instalacion de Graal"source /home/renito/.gvm/scripts/gvm
sdk i java 19.2.1-grl
sdk d java 19.2.1-grl

# Se instalan las fonts
echo "Instalando Fonts"
cd
mkdir Apps
cd Apps
git clone https://github.com/powerline/fonts.git
cd fonts
chmod +x install.sh
./install.sh


# Instalar GO
echo "Instalando GOLANG"
sudo apt-get install bison -y
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.14
gvm use go1.14
echo "source /home/renito/.gvm/scripts/gvm" >> ~/.zshrc


# Instalar Docker
echo "Instalando Docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker devconnected

# Instalar vscode
echo "Instalando vscode"
sudo apt-get -y install code

# Instalar terminator
echo "Instalando Terminator"
sudo apt-get -y install terminator

# Instalar nvm
echo "Instalando node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

# Sets zsh as default shell
chsh -s $(which zsh)

#Finalizando setup
echo "clear" >> ~/.zshrc
source ~/.zshrc

# Reminders
echo
echo "*****************"
echo "Recuerda:" 
echo "- cambiar la fuente del terminal a Source Code Pro for Powerline Medium"
echo "- instalar gotools en vscode"
echo " "
echo "Reiniciando en 30 segundos..."

sleep 30s
sudo reboot -h now
