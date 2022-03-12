<h1 align="center">My dotfiles Repository 🐧</h1>


<p align="center">
<img src="https://img.shields.io/badge/bash-script-brightgreen" />
<img src="https://img.shields.io/badge/linux-enviroment-blue" />
</p>

<br>

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

- [ ] Auto update script from repository

<br>

## How to install
 
 First clone or download files from repo. **Git and SSH must be installed and configured before**.

```bash
$ git clone git@github.com:brnfra/dotfiles.git
```
Next, before run the ___brnfra_default_enviroment.sh___ script. Read and edit it first for your purpose, it will create some folders and copy config files. 
Change **user** and **email** to your *user-name* and *user-email* as well. Attention on ssh-key problems, just in case, you find help [here](https://docs.github.com/pt/authentication/connecting-to-github-with-ssh).

```bash
$ cd dotfiles/
$ chmod +x brnfra_default_enviroment.sh
$ sh brnfra_default_enviroment.sh
```
<br>

- [**Optional**] If you'll create enviroment to Java, Spring and React the script ___brnfra_java_spring_react.sh___ install *Heroku CLI*, *Postman*, *VSCode* and *Spring Tool Suite* in folder ```~/.local/opt/``` and add **PATH** to **.bash_exports**.

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
