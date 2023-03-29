<h1 align="center">Dotfiles Repository 🐧</h1>

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
- In a wonderful tutorial by ___[Nicola Paolucci](https://www.atlassian.com/git/tutorials/dotfiles)___
Thank you guys for sharing :heart:
- Tests by [Shunit2](https://github.com/kward/shunit2)
<br>

## Sumary

- [Requirements](https://github.com/brnfra/dotfiles#requirements)
- [Install](https://github.com/brnfra/dotfiles#how-to-install)
- [Pull state from remote after installation](https://github.com/brnfra/dotfiles#pull-state-from-remote-to-local-config)
- [Update my dotfiles after installation](https://github.com/brnfra/dotfiles#update-remote-state-from-local-to-remote)
- [Uninstalling](https://github.com/brnfra/dotfiles#uninstall-and-back-config)
- [Dependencies(check your pkgs)](https://github.com/brnfra/dotfiles#dependencies)
- [Keybindings](https://github.com/brnfra/dotfiles#keybindings)

## Using git to manage config files.

### Main config

1. Tested in Gnu/Linux based distro(**Debian based**, pls check first).
2. Pls check ```~/.i3/autostart/i3config``` . There's change in keyboard layout and resolution.
3. The keyboard layout is **US-INT**.

### Mingw32(git-for-windows) config(mingw32-w8 branch)

1. Config files for Gnu/Linux based distro systems(git-bash.exe).
2. Remove scripts for programs for linux systems.
3. Remove .config/ folder and some configurations.
4. The keyboard layout is **PT-BR,ABNT**.

**ATTENTION**: Please, DO NOT copy/run any file here in your system **if you do not fully understand what it does**. Seriously, **DON'T do it!**
This configuration works with **i3-wm** and **i3status**.  

## TODO

- [ ] Make scripts to generate configs(i3blocks, vim,  etc)
- [ ] Add new tests

<br>

## Requirements

- Git
- Ssh 
- Curl

## How to install
 
This method consist to use git to track your config files. **You don't have to install extra tool**, only need git, ssh(coreutils) and curl.
Install config tracking in your **$HOME** following the comand;

1. Fork this repository.

2. Edit ```/bin/install``` file to put your repository url, branch name, email and name.

3. Update your remote forked repository (push changes) and execute script bellow ( **check your username** ).


If Desktop/Virtual/Notebooks, copy/paste in terminal;
```bash
bash -c "$(curl -s --max-time 15  https://raw.githubusercontent.com/[YOUR_USER_NAME]/dotfiles/main/bin/install)";
```

If Desktop/Virtual/Notebooks, copy/paste in terminal(*DEFAULT*);
```bash
bash -c "$(curl -s --max-time 15  https://raw.githubusercontent.com/brnfra/dotfiles/main/bin/install)";
```

If _testing_, copy/paste in terminal(*DEFAULT*);
```bash
bash -c "$(curl -s --max-time 15  https://raw.githubusercontent.com/brnfra/dotfiles/testing/bin/install)";
```

If _Mingw_ for Windows, copy/paste in terminal;
```bash
 bash -c "$(curl -s --max-time 15  https://raw.githubusercontent.com/[YOUR_USER_NAME]/dotfiles/mingw32-w8/bin/install-mingw-cfg)"; bash ~/bin/install_enviroment
```

<br>

- Check the script ```~/bin/dotfiles_env``` and change username, email and the places where script will save your files. Configure your definitions **before** run it.

- *Read and edit it first for your purpose*, it will create some folders and copy config files, recomend fork/clone this repo and coment that line.

- You can change branch in home, after install, run ```$ config checkout testing ```, for example.

Attention on ssh-key problems, just in case, check your email and user, you find help [here](https://docs.github.com/pt/authentication/connecting-to-github-with-ssh).
<br>

## Update remote state from local to remote 

If I change configuration and like it, *How can I update for this change?*
- You can update your remote repository and, after tests, run the script below. 

1. Clone this repo in another local.(here the default is ```~/documents/projects/git/ ``` )
2. Change to the correspondent branch by ```git switch [main or mingw32-w8]``` 
3. Make the changes and push to remote repo in correspondent branch. 
4. In the computers run pull script and receive the updates.(wait a minute in the same computer to update HEAD)

Run ```$ push_local_config "COMMIT MESSAGE" ``` gonna make copy my edited config files to
**dotfiles** folder created in ```enviroment script``` and push to your remote repository[auto].
- Will push only if tests are passed.

Run ```$ stage-local-config``` gonna only make copy, without push, the edited config files to
**dotfiles** folder. Now check the status and, if it's fine, next, proceed to push changes[manual].
- No tests here.

```bash

$ git push origin [main/testing/mingw32-w8]

```

Now, Git gonna **update snapshot** from local to remote. Your other machines just run pull_config(or add in init) to get it.

## Pull state from remote to local config

After install, if remote has changed you can pull config to sync local, *How can I sync local for this change?*
- You can pull to your local repository run the script below. 

In the folder ```~/bin``` there is a script named ```pull_config``` such make a "**pull request**" like a normal git repo. 

Just run;

```bash

$ pull_config

or

$ bash ~/bin/pull_config 

```

Now, Git gonna **update snapshot** (pull)from remote repo to your $HOME folder.

## Uninstall and back config

Run in terminal 

```bash

$ uninstall_bare_cfg

# or

$ bash ~/bin/uninstall_bare_cfg

```

## Dependencies

Some pkgs here have conflicts with i3-gaps(i3-wm) and, after fork, **make changes to yours needs**.
For some features depends some packages, if get some error related, this list maybe help;

- i3blocks
- nm-applet(tool to show network icon)
- diodon(tool to show transfer area icon)
- scrot(print screen)
- compton(composer)
- nitrogen(wallpaper)
- fzf
- fdfind
- exa
- rsync
- jq
- acpi(temperatures and battery)
- gsimplecal(tiny calendar i3blocks)
- shunit2(tests)
- sysstat(cpu info)
- Xfce4-terminal

## Keybindings

<details open>
  <summary><strong> I3 window manager </strong></summary>

  | Key | Details |
  | :-  | :-  |
  | <kbd>Mod</kbd> + <kbd>d</kbd>			    | fzf D-menu to find applications
  | <kbd>Mod</kbd> + <kbd>Esc</kdb>			    | Exit menu(shutdown, restart, logout)
  | <kbd>Mod</kbd> + <kbd>e</kdb>			    | Exit menu(logout)
  | <kbd>Mod</kbd> + <kbd>Enter</kbd>                       | Open Xfce4 terminal
  | <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>l</kdb>	    | Resize window
  | <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>b</kbd>         | Put window in last workspace
  | <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>[1-9]</kbd>	    | Put window in workspace #number without go to workspace
  | <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>[1-9]</kbd>    | Put window in workspace #number and go to workspace
  | <kbd>Mod</kbd> + <kbd>[1-9]</kbd>			    | Go to workspace #number
  | <kbd>Mod</kbd> + <kbd>Tab</kbd>			    | Toggle workspaces
  | <kbd>Mod</kbd> + <kbd>Arrows</kbd>			    | Workspace focus direction
  | <kbd>Mod</kbd> + <kbd>[yjui]</kbd>			    | Workspace focus direction
  | <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>Arrows</kbd>   | Workspace move direction
  | <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>[yjui]</kbd>   | Workspace move direction
  | <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>f</kbd>	    | Toggle fullscreen
  | <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>s</kbd>	    | Layout stacking
  | <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>t</kbd>	    | Layout tabbed
  | <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd>	    | Layout toggle
  | <kbd>Mod</kbd> + <kbd>v</kbd>			    | Split window direction(horizontally)
  | <kbd>Mod</kbd> + <kbd>h</kbd>			    | Split window direction(vertically)
  | <kbd>Mod</kbd> + <kbd>x</kbd>			    | Split window mode toggle
  | <kbd>Mod</kbd> + <kbd>f</kbd>			    | Window floating toggle
  | <kbd>Mod</kbd> + <kbd>Space</kbd>			    | Focus mode toggle
  | <kbd>Mod</kbd> + <kbd>a</kbd>			    | Focus parent 
  | <kbd>Ctrl</kbd> + <kbd>1</kbd>			    | Open firefox
  | <kbd>Ctrl</kbd> + <kbd>0</kbd>			    | Open i3 config(vim)

</details>

<details>
  <summary><strong> Xfce4 Terminal </strong></summary>

  | Key | Details |
  | :-  | :-  |
  | <kbd>Ctrl</kbd> + <kbd>f</kbd>			    | fzf find
  | <kbd>Ctrl</kbd> + <kbd>o</kdb>			    | fzf open
  | <kbd>Ctrl</kbd> + <kbd>v</kdb>			    | Neo vim

</details>

<details>
  <summary><strong> Vim </strong></summary>

  | Mode | Key | Details |
  | :-  | :-  | :-  |
  | Normal  | <kbd>Ctrl</kbd> + <kbd>q</kbd>	    | quit
  | Normal  | <kbd>Ctrl</kbd> + <kbd>Q</kdb>	    | force quit
  | Normal  | <kbd>Ctrl</kbd> + <kbd>s</kdb>	    | save all
  | Normal  | <kbd>Ctrl</kbd> , <kbd>c</kdb>	    | copy selection to xclip
  | Normal  | <kbd>0</kbd> , <kbd>v</kdb>	    | reload vimrc
  | Normal  | <kbd>=</kbd> , <kbd>v</kdb>	    | reload vimrc and redraw
  | Normal  | <kbd>F3</kbd>			    | toggle show nerdtree
  | Normal  | <kbd>F4</kbd>			    | easy indent file
  | Normal  | <kbd>F5</kbd>			    | toggle wrap
  | Normal  | <kbd>F6</kbd>			    | set paste toggle
  | Normal  | <kbd>F7</kbd>			    | toggle fold
  | Normal  | <kbd>F8</kbd>			    | One line text( u to undo )
  | Normal  | <kbd>leader</kbd> + <kbd>f</kdb>	    | create fold
  | Normal  | <kbd>leader</kbd> + <kbd>d</kdb>	    | delete blank spaces
  | Normal  | <kbd>leader</kbd> + <kbd>D</kdb>	    | delete blank lines
  | Normal  | <kbd>leader</kbd> + <kbd>M</kdb>	    | MAN entry
  | Normal  | <kbd>leader</kbd> + <kbd>l</kdb>	    | open terminal
  | Normal  | <kbd>leader</kbd> + <kbd>/</kdb>	    | split window open 
  | Normal  | <kbd>leader</kbd> + <kbd>-</kdb>	    | split window open
  | Normal  | <kbd>+</kbd> + <kbd>l</kdb>	    | add line
  | Normal  | <kbd>Ctrl</kbd> + <kbd>a</kdb>	    | select all
  | Normal  | <kbd>Ctrl</kbd> + <kbd>+</kdb>	    | font size up
  | Normal  | <kbd>Ctrl</kbd> + <kbd>-</kdb>	    | font size down
  | Normal  | <kbd>Ctrl</kbd> + <kbd>Arrows</kdb>   | switching window buffer(nerdtree too)
  | Normal  | <kbd>Shift</kbd> + <kbd>Tab</kdb>	    | tabs toggle r
  | Normal  | <kbd>Tab</kbd>			    | tabs toggle l
  | Normal  | <kbd>U</kbd>			    | redo
  | Normal  | <kbd>Shift</kbd> + <kbd>up</kdb>	    | move line up
  | Normal  | <kbd>Shift</kbd> + <kbd>down</kdb>    | move line down
  | Insert  | <kbd>leader</kbd> + <kbd>v</kdb>	    | edit vimrc
  | Insert  | <kbd>F3</kbd>			    | toggle show line numbers
  | Insert  | <kbd>F4</kbd>			    | easy indent file
  | Insert  | <kbd>F5</kbd>			    | toggle wrap
  | Insert  | <kbd>F7</kbd>			    | toggle fold
  | Insert  | <kbd>F8</kbd>			    | one line text( u to undo )
  | Insert  | <kbd>leader</kbd> + <kbd>f</kdb>	    | create fold
  | Insert  | <kbd>leader</kbd> + <kbd>/</kdb>	    | close tags
  | Insert  | <kbd>leader</kbd> + <kbd>M</kdb>	    | MAN entry
  | Insert  | <kbd>Ctrl</kbd> + <kbd>arrows</kdb>   | move fast
  | Insert  | <kbd>Ctrl</kbd> + <kbd>d</kdb>	    | duplicate block
  | Insert  | <kbd>Ctrl</kbd> + <kbd>d</kdb>	    | duplicate block
  | Insert  | <kbd>Shift</kbd> + <kbd>up</kdb>	    | move line up
  | Insert  | <kbd>Shift</kbd> + <kbd>down</kdb>    | move line down
  | Visual  | <kbd>Ctrl</kbd> + <kbd>up</kdb>	    | move block up
  | Visual  | <kbd>Ctrl</kbd> + <kbd>down</kdb>	    | move block down
  | Visual  | <kbd>Ctrl</kbd> + <kbd>d</kdb>	    | duplicate block

</details>

## Problems

If you get the error message 

```:fatal: destination path '/home/$USER/.dotfiles' already exists and is not an empty directory. ``` 

after install or trying update your local configs, try this;

1. Delete, in your home folder, ```~/.dotfiles/``` .

2. Re-run the command curl for install again.

For other problems, again, check your name and email in install_enviroment or comment.

## Feedback

Suggestions/improvements
[welcome](https://github.com/brnfra/dotfiles/issues)!

## Author

| :---: | 
|[<img src="https://avatars.githubusercontent.com/brnfra" width=115 > <br> <sub> Bruno Franco </sub>](https://github.com/brnfra) |

## Thanks to…

* [Nicola Paolucci](https://www.atlassian.com/git/tutorials/dotfiles) make your own bare repo dotfiles tutorial
* [@StreakyCobra](https://news.ycombinator.com/item?id=11070797) Hacker News threat
* [Mathias Bynens](https://github.com/mathiasbynens) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
* [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Luke Smith](https://lukesmith.xyz/) and his [dotfiles repository](https://github.com/LukeSmithxyz/voidrice)
* [Le Wagon dotfiles](https://github.com/LukeSmithxyz/voidrice)
* [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
* [Gianni Chiappetta](https://butt.zone/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
* Lauri ‘Lri’ Ranta for sharing [loads of hidden preferences](https://web.archive.org/web/20161104144204/http://osxnotes.net/defaults.html)
* [Matijs Brinkhuis](https://matijs.brinkhu.is/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
* [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
* [Sindre Sorhus](https://sindresorhus.com/)
* [Tom Ryder](https://sanctum.geek.nz/) and his [dotfiles repository](https://sanctum.geek.nz/cgit/dotfiles.git/about)
* [Kevin Suttle](http://kevinsuttle.com/) and his [dotfiles repository](https://github.com/kevinSuttle/dotfiles) and [macOS-Defaults project](https://github.com/kevinSuttle/macOS-Defaults), which aims to provide better documentation for [`~/.macos`](https://mths.be/macos)
* [Haralan Dobrev](https://hkdobrev.com/)
* For anyone that a make a copy and don't make a mension, tell me and I'll give the credit, my thank you.

### License 

The [MIT License]() (MIT)


[Back to Top](https://github.com/brnfra/dotfiles#my-dotfiles-repository-)
