# code providing by ;
#  - originally by user StreakyCobra in https://news.ycombinator.com/item?id=11070797
#  - in your wonderful tutorial, Nicola Paolucci, in https://www.atlassian.com/git/tutorials/dotfiles
REPO="https://github.com/brnfra/dotfiles.git"

git clone --bare $REPO "$HOME/.dotfiles"
function config {
    GITCMD=$(type git | awk {'print $3'})
    $GITCMD --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}

config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | grep "^\s+" | awk {'print $1'} | xargs -I{} mv {} {}.backup
fi;
config checkout
config config status.showUntrackedFiles no
