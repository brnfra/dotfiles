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
- [Pull state from remote after installation](https://github.com/brnfra/dotfiles#pull-state-from-remote-to-local-config)
- [Update my dotfiles after installation](https://github.com/brnfra/dotfiles#update-remote-state-from-local-to-remote)
- [Dependencies(check your pkgs)](https://github.com/brnfra/dotfiles#dependencies)

## Using git to manage config files.

### Main config

1. Tested in Gnu/Linux based distro(**Debian based**, pls check first).
2. Pls check **$HOME/.i3/autostart/i3config.sh**. There's change in keyboard layout and resolution.
3. The keyboard layout is **US-INT**.

<img width="700" alt="workspace exemple image" src="exemple/Screenshot_workspace.png"></img>

### Mingw32(git-for-windows) config(mingw32-w8 branch)

1. Config files for Gnu/Linux based distro systems(git-bash.exe).
2. Remove scripts for programs for linux systems.
3. Remove .config/ folder and some configurations.
4. The keyboard layout is **PT-BR,ABNT**.

**ATTENTION**: Please, DO NOT copy/run any file here in your system **if you do not fully understand what it does**. Seriously, **DON'T do it!**)**
This configuration works with **i3-wm** and **i3status**.  

## TODO

- [x] Auto update script from repository
- [x] Branches for each computers
- [x] Remove unecessary scripts for mingw32
- [x] Fix audio/mic control for notebook-cfg in i3block config
- [ ] Tested and refactoring

<br>

## Requirements

- Git
- Ssh 
- Curl

## How to install
 
This method consist to use git to track your config files. **You don't have to install extra tool**, only need git, ssh(coreutils) and curl.
Install config tracking in your **$HOME** following the comand;

1. Fork this repository.

2. Edit ```install```  file REPO URL and   ```install_enviroment```, in  ```dotfiles/bin/```   to put your URL,username and email.

3. Update your remote forked repository  and execute script bellow ( **check your username** ).


>If Desktop/Virtual/Notebooks, copy/paste in terminal;
```bash
bash -c "$(curl -s --max-time 15  https://raw.githubusercontent.com/[YOUR_USER_NAME]/dotfiles/main/bin/install)"; bash ~/bin/install_enviroment
```

>If Mingw for Windows, copy/paste in terminal;
```bash
 bash -c "$(curl -s --max-time 15  https://raw.githubusercontent.com/[YOUR_USER_NAME]/dotfiles/mingw32-w8/bin/install-mingw-cfg)"; bash ~/bin/install_enviroment
```

<br>

The script ```~/bin/install_enviroment``` has my username and email. Configure your locals definitions. Type and go. 
*Read and edit it first for your purpose*, it will create some folders and copy config files, you can fork this repo and coment that line.
Attention on ssh-key problems, just in case, you find help [here](https://docs.github.com/pt/authentication/connecting-to-github-with-ssh).
<br>

- [**Optional**] If you'll create enviroment to Java, Spring and React the script ___java_spring_react.sh___ gonna install *Heroku CLI*, *Postman*, *VSCode* and *Spring Tool Suite* in folder ```~/.local/opt/``` and add the **PATH** to **.bash_exports**.
In the ``` ~/bin```  folder there are scripts for each case.

## Pull state from remote to local config

After install, if remote has changed configuration and you want pull it, *How can I update local for this change?*
- You can pull to your local repository run the script below. 

In the folder ```~/bin``` there is a script named ```pull-config``` such make a "**pull request**" like a normal git repo. Just run;
```
$ bash ~/bin/pull-config
```
Now, Git gonna **update snapshot** from remote repo to your $HOME folder.

## Update remote state from local to remote 

If I change configuration and like it, *How can I update for this change?*
- You can update your remote repository and, after tests, run the script below. 

1. Clone this repo in another local.(here the default is ``` ~/documents/projects/git/ ``` )
2. Change to the correspondent branch by ```git switch [main/mingw32-w8/notebook-cfg]``` 
3. Make the changes and push to remote repo in correspondent branch. 
4. In the computers run pull script and receive the updates.(wait a minute in the same computer to update HEAD)

In the folder ```~/bin``` there is a script named ```stage-local-config``` gonna make copy my edited config files to
**dotfiles** folder. Now check the status and if it's fine proceed to push changes, just run;
```
$ git push origin [main/mingw32-w8/notebook-cfg]
```
Now, Git gonna **update snapshot** from local to remote.

## Dependencies

Some pkgs here have conflicts with i3-gaps(i3-wm) and, after fork, **make changes to yours needs** in files.

- i3blocks
- nm-applet(tool to show network icon)
- diodon(tool to show transfer area icon)
- gnome-screenshot(printscreen)
- compton(composer)
- nitrogen(wallpaper)
- fzf
- fdfind
- exa

Some functions require some aplications and packages like xorg,fzf,fdfind for example.
If you want full functions here will required, for some functions, the previous installation of some packages like;


- I3-wm
- I3blocks or  I3status configs
- i3status
- Compton
- Vim
- NeoVim
- Vifm
- Rofi
- Xfce4-terminal
- fzf
- tmux 

## Problems

If you get the error message 

```:fatal: destination path '/home/$USER/.dotfiles' already exists and is not an empty directory. ``` 

after install or trying update your local configs, try this;

1. Delete, in your home folder, ```  ~/.dotfiles/``` .

2. Re-run the command curl for install again.

For other problems, again, check your name and email in install_enviroment or comment.

[Back](https://github.com/brnfra/dotfiles#my-dotfiles-repository-)
