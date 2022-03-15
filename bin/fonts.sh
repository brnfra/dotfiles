#!/bin/bash

#Fonts
cd "$HOME/.fonts" || return

nerdfont="nerdfont.zip"
codeNewRoman="codeNewRoman.zip"
monofur="Monofur.zip"

echo -e "\n\n Downloading Nerdfont..."
if $(curl -# -k -o $nerdfont -O "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip") 
then
    unzip -xvf $nerdfont 
    echo "extract accomplished"
fi


echo -e "\n\n Downloading CoeNewRoman..."
if $(curl -# -k -o $codeNewRoman -O "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CodeNewRoman.zip") 
then
    unzip -xvf $codeNewRoman 
    echo "extract accomplished"
fi


echo -e "\n\n Downloading Monofur..."
if $(curl -# -k -o $monofur -O "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip") 
then
    unzip -xvf $monofur 
    echo "extract accomplished"
fi

fc-cache -vf "$HOME/.fonts/"

echo -e "\nAll done!\n"

exit 0
