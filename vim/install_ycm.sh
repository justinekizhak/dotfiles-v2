#!/bin/bash
has_vim=$(command -v vim >/dev/null)

if ! $has_vim; then
  echo "must have vim installed."
  exit 1
fi

download_llvm(){
    echo "downloading llvm"
    mkdir ~/ycm_temp
    cd ~/ycm_temp
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        wget "http://releases.llvm.org/6.0.0/clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz"
        tar -xJf clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mv clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04 llvm_root_dir
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        curl http://releases.llvm.org/6.0.0/clang+llvm-6.0.0-x86_64-apple-darwin.tar.xz
        tar -xzf clang+llvm-6.0.0-x86_64-apple-darwin.tar.xz
        mv clang+llvm-6.0.0-x86_64-apple-darwin llvm_root_dir
    fi
}

dev_tools_for_ubuntu(){
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        sudo apt-get install build-essential cmake python-dev python3-dev
    fi
}

install_ycm () {
    echo "all good"
    download_llvm
    dev_tools_for_ubuntu
    cd ~
    mkdir ycm_build
    cd ycm_build
    cmake -G "Unix Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DPATH_TO_LLVM_ROOT=~/ycm_temp/llvm_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    cmake --build . --target ycm_core --config Release
    cd ~/.vim/bundle/YouCompleteMe
    python3 install.py --clang-completer
    rm -rf ~/ycm_temp
    rm -rf ~/ycm_build
}

# Checking the python support based on the line output received
has_python_support=$(vim --version | grep -c python)

# Matching the decimal pattern from the first line
vim_version=$(vim --version | head -1 | grep -o '[0-9]\.[0-9]')

# Getting patch version from vim
vim_patch_version=$(vim --version | sed -n '2,3p' | grep -o '[0-9][0-9][0-9][0-9]')

if [ $(echo "$vim_version >= 7.4" | bc -l) ] && \
    [ $has_python_support ] && \
    [ $(echo "$vim_patch_version >=1578 " | bc -l) ]; then
    install_ycm
else
     echo "vim version must be at least 7.4 with included patches \
higher than 1578 and must be installed with python support"
fi
