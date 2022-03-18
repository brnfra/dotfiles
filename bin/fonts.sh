#!/bin/bash

#Fonts
cd "$HOME/.fonts" || return
nerdfont="nerdfont.zip"
codeNewRoman="codeNewRoman.zip"
monofur="Monofur.zip"

echo -e "\n\n Downloading Nerdfont..."
curl -C - -Lkso $nerdfont "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip" 
echo -e "\n\n Downloading CoeNewRoman..."
curl -C - -Lkso $codeNewRoman "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CodeNewRoman.zip"
echo -e "\n\n Downloading Monofur..."
curl -C - -Lkso $monofur "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip"

unzip -uCoq $nerdfont $codeNewRoman $monofur

fc-cache -vf "$HOME/.fonts/"
echo -e "\nAll done!\n"

exit 0
