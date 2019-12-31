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
wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/renito-agnoster.zsh-theme
wget renito-agnoster.zsh-theme
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
echo "Inicia instalacion de Graal"
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
sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo add-apt-repository -y ppa:gophers/archive
sudo apt-get update
sudo apt-get -y install golang-go


# Instalar Docker
echo "Instalando Docker"
sudo snap install docker
sudo groupadd docker
sudo usermod -aG docker $USER

# Instalar vscode
sudo apt-get -y install code

# Instalar Intellij idea
sudo add-apt-repository -y ppa:mmk2410/intellij-idea-community
sudo apt update
sudo apt install -y intellij-idea-community

# Instalar terminator
sudo apt-get -y install terminator

# Instalar nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

#Finalizando setup
echo "clear" >> ~/.zshrc
source ~/.zshrc

# Reminders
echo
echo "*****************"
echo "Recuerda:" 
echo "- cambiar la fuente del terminal a Source Code Pro for Powerline Medium"
echo "- instalar gotools en vscode"
