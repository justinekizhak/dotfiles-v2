#!/bin/bash
has_vim=$(command -v vim >/dev/null)

if ! $has_vim; then
  echo "must have vim installed."
  exit 1
fi

install_cmdT () {
    echo "all good"
    cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
    ruby extconf.rb
    make
}

install_system_ruby(){
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        sudo apt-get install ruby-full
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ruby
    fi
}

# Checking the ruby support based on the line output received
has_ruby_support=$(vim --version | grep -c ruby)

if [ $has_ruby_support ]; then
    if [ $(which ruby) ]; then
        install_cmdT
    else
        install_system_ruby
    fi
else
    echo "your vim doesn't have support for ruby. \
You will have to install vim from source."
fi
