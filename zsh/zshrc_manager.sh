############################################################################
# Last Modified:    Mon 14 May 2018 03:03:42 PM IST
#
# This file is part of project name
# (see https://github.com/justinethomas009/dotfiles)
# When you launch a new terminal window this script runs first and
# launches tmux. This script also make sures all your dotfiles are
# updated with the github repo.
# After that it sources your zshrc.vim
#
# Copyright (C) 2018, Justine T Kizhakkinedath
# All rights reserved
#
# Licensed under the term of MIT License
# See LICENSE file in the project root for full license information.
############################################################################

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
