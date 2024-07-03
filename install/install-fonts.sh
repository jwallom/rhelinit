#!/bin/bash
# This sets up gnome on RHEL 9 for my settings.

# Setup fonts
mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/DejaVuSansMono.zip
unzip DejaVuSansMono.zip -d DejaVuSansFont
cp DejaVuSansFont/*.ttf ~/.local/share/fonts
rm -rf DejaVuSansMono.zip DejaVuSansFont

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp CascadiaFont/*.ttf ~/.local/share/fonts
rm -rf CascadiaMono.zip CascadiaFon

fc-cache
cd -
