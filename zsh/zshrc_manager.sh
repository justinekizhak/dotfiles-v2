time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# Run tmux if exists
if command -v tmux>/dev/null; then
	[ -z $TMUX ] && exec tmux
else 
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi

#(cd ~/dotfiles && time_out 3 git pull && time_out 3 git submodule update --init --recursive)

time_out 3 ping -q -c1 google.com > /dev/null
 
if [ $? -eq 0 ]
then
    echo "online";
    echo "Updating configuration"
    (cd ~/dotfiles && git pull && git submodule update --init --recursive)
else
    echo "offline";
fi

source ~/dotfiles/zsh/zshrc.sh
