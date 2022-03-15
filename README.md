<h1 align="center">My dotfiles Repository 🐧</h1>


<p align="center">
<img src="https://img.shields.io/badge/bash-script-brightgreen" />
<img src="https://img.shields.io/badge/linux-enviroment-blue" />
<img src="https://img.shields.io/badge/requirement-git-orange" />
<img src="https://img.shields.io/badge/requirement-curl-importany" />
<img src="https://img.shields.io/badge/tests-in%20progress-red" />
</p>

<br>

_This code was provided by_ ;
- originally by user ___StreakyCobra___ in an [Hacker News thread](https://news.ycombinator.com/item?id=11070797)
- in a wonderful tutorial by ___[Nicola Paolucci](https://www.atlassian.com/git/tutorials/dotfiles)___

Thank you guys for sharing

<br>

- [Requirements](https://github.com/brnfra/dotfiles#requirements)
- [Install](https://github.com/brnfra/dotfiles#how-to-install)
- [Dependencies](https://github.com/brnfra/dotfiles#dependencies)

## My config files to automate computer changing configuration.

1. Config files for Gnu/Linux based distro systems.
2. The config files expect *two monitors*, maybe you have to change some things.
3. The **$HOME/.config/i3/autostart/wallpaper.sh** will change **different wallpaper** for
   each monitor, if you don't want this, change it.
4. The i3config script _rotate the 2nd monitor to right and move it to right of the
   first_.
5. The keyboard layout is **US-INT**.

**ATTENTION**: Please, DO NOT copy/run any file here in your system **if you do not fully understand what it does**. Seriously, **DON'T do it!**)**


<br>

## TODO

- [x] Auto update script from repository
- [ ] Branches for each computers

<br>

## Requirements

- Git
- Ssh 
- Curl

## How to install
 
This method consist in use git to track your config files. You don't have to install extra tool, only git, ssh(coreutils) and curl.
Install config tracking in your $HOME following the comand;

```bash
$ curl -Lks https://raw.githubusercontent.com/brnfra/dotfiles/master/.bin/install.sh | /bin/bash
```
The script will require your name and email to configure your locals definitions. Type and go. 
*Read and edit it first for your purpose*, it will create some folders and copy config files, you can fork this repo and coment that line.
Attention on ssh-key problems, just in case, you find help [here](https://docs.github.com/pt/authentication/connecting-to-github-with-ssh).
<br>

- [**Optional**] If you'll create enviroment to Java, Spring and React the script ___java_spring_react.sh___ gonna install *Heroku CLI*, *Postman*, *VSCode* and *Spring Tool Suite* in folder ```~/.local/opt/``` and add **PATH** to **.bash_exports**.
In the ``` ./bin```  folder there are scripts for each case.

## Dependencies

- I3wm configs
- I3blocks and I3status configs
- Compton
- Vim
- NeoVim
- Vifm
- Rofi
- Xfce4-terminal
- fzf
- tmux 

Some functions require some aplications and packages like xorg,fzf,fdfind for example.
If you want full functions here will required, for some functions, the previous installation of some packages like;

- nm-applet(tool to show network icon)
- diodon(tool to show transfer area icon)
- gnome-screenshot(printscreen)
- compton(composer)
- nitrogen(wallpaper)
- fzf
- fdfind
- exa


[Back](https://github.com/brnfra/dotfiles#my-dotfiles-repository-)
