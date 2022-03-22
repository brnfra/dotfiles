<h1 align="center">My dotfiles Repository 🐧</h1>

<p align="center">
<img src="https://img.shields.io/badge/bash-script-brightgreen" />
<img src="https://img.shields.io/badge/requirement-git-orange" />
<img src="https://img.shields.io/badge/requirement-curl-importany" />
<img src="https://img.shields.io/badge/tests-in%20progress-red" />
<img src="https://img.shields.io/badge/license-MIT-informational" />
<img src="https://img.shields.io/badge/platform-linux--64-lightgrey" />
<img src="https://img.shields.io/github/last-commit/brnfra/dotfiles" />
</p>
<br>

_This code was provided by_ ;
- originally by user ___StreakyCobra___ in an [Hacker News thread](https://news.ycombinator.com/item?id=11070797)
- in a wonderful tutorial by ___[Nicola Paolucci](https://www.atlassian.com/git/tutorials/dotfiles)___
Thank you guys for sharing :heart:

<br>

## Sumary

- [Requirements](https://github.com/brnfra/dotfiles#requirements)
- [Install](https://github.com/brnfra/dotfiles#how-to-install)
- [Update my dotfiles after installation](https://github.com/brnfra/dotfiles#updates)
- [Dependencies(check your pkgs)](https://github.com/brnfra/dotfiles#dependencies)

## My config files to automate computer changing configuration.

1. Config files for Gnu/Linux based distro systems and "Git for windows"(mingw).
2. The config files expect *two monitors* in desktop, maybe you have to change some things in *wallpaper* and *resolution* script in ```~/.config/i3/autostart```.
3. The **$HOME/.config/i3/autostart/wallpaper.sh** will change **different wallpaper** for
   each monitor, if you don't want this, change it. Put the images files in ```~/.wallpapers```
4. The i3config script _rotate the 2nd monitor to right and move it to right of the first_ in desktop config.
5. The keyboard layout is **US-INT** in desktop and **PT-BR,ABNT** to notebook.

**ATTENTION**: Please, DO NOT copy/run any file here in your system **if you do not fully understand what it does**. Seriously, **DON'T do it!**)**

## TODO

- [x] Auto update script from repository
- [x] Branches for each computers
- [ ] Fix audio/mic control for notebook-cfg in i3block config
- [ ] Testing and refactoring

<br>

## Requirements

- Git
- Ssh 
- Curl

## How to install
 
This method consist to use git to track your config files. **You don't have to install extra tool**, only need git, ssh(coreutils) and curl.
Install config tracking in your **$HOME** following the comand;

>If Desktop, run;
```bash
curl -Lks https://raw.githubusercontent.com/brnfra/dotfiles/main/bin/install | /bin/bash
```
>If Mingw/Windows 8, run;
```bash
curl -Lks https://raw.githubusercontent.com/brnfra/dotfiles/main/bin/install-mingw-cfg | /bin/bash
```
>If Notebook(batery and temp indicator, wifi graduated signa), run;
```bash
curl -Lks https://raw.githubusercontent.com/brnfra/dotfiles/main/bin/install-note-cfg | /bin/bash
```

<br>

The script ```~/bin/config.sh``` will require your name and email to configure your locals definitions. Type and go. 
*Read and edit it first for your purpose*, it will create some folders and copy config files, you can fork this repo and coment that line.
Attention on ssh-key problems, just in case, you find help [here](https://docs.github.com/pt/authentication/connecting-to-github-with-ssh).
<br>

- [**Optional**] If you'll create enviroment to Java, Spring and React the script ___java_spring_react.sh___ gonna install *Heroku CLI*, *Postman*, *VSCode* and *Spring Tool Suite* in folder ```~/.local/opt/``` and add the **PATH** to **.bash_exports**.
In the ``` ~/bin```  folder there are scripts for each case.

## Updates

If I change configuration and like it, *How can I update for this change?*
- You can update your remote repository and, after tests, run the script below.

In the folder ```~/bin``` there is a script named ```update.sh``` such make a "**pull request**" like a normal git repo. *After install*, just run;
```
$ bash ~/bin/update.sh
```
Now, Git gonna **update snapshot** of the remote repo in your $HOME.

## Dependencies

Some pkgs here are installed in my computer, after fork, **make changes to yours needs**.

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
