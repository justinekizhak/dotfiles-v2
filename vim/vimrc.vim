""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Last Modified:    Mon 14 May 2018 02:58:25 PM IST
"
" This file is part of my dotfiles
" (see https://github.com/justinethomas009/dotfiles)
" My vimrc file
"
" Copyright (C) 2018, Justine T Kizhakkinedath
" All rights reserved
"
" Licensed under the term of MIT License
" See LICENSE file in the project root for full license information.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""COMMON SETTINGS"""""""""""""""""""""""""""""""""""
    "Automatic reloading of .vimrc
        augroup sourcing_vimrc
            au!
            autocmd! bufwritepost ~/dotfiles/vim/vimrc.vim source ~/dotfiles/vim/vimrc.vim
        augroup END

    "Setting leader key
        let mapleader = ","

    "Need to set this flag on in order to have many cool features on
        set nocompatible

    "Spellcheck for vim
        augroup spell_check
            au!
            autocmd FileType latex,tex,md,markdown setlocal spell
            set spelllang=en_us
            set spellfile=~/dotfiles/vim/en.utf-8.add
        augroup END

    "Syntax highlighting by default
        syntax on
        set synmaxcol=128
        syntax sync minlines=256
        augroup syntax_highlighting
            au!
            autocmd BufEnter * :syn sync maxlines=500
        augroup END
    "Numbering and relative numbering
        set number
        set relativenumber

    "Quick editing of vimrc
        map <leader>ev :e! ~/dotfiles/vim/vimrc.vim<cr>
        map <leader>ep :e! ~/dotfiles/vim/plugins.vim<cr>

    "Yank to clipboard
        if has("clipboard")
            set clipboard=unnamed " copy to the system clipboard
            if has("unnamedplus") " X11 support
                set clipboard+=unnamedplus
            endif
        endif

    "Working directory
        cd ~/My_Projects    "if your OS is Linux

    "Make Vim deal with case-sensitive search intelligently
        set ignorecase
        set smartcase
        set incsearch       "Show search matches as you type
        set hlsearch        "Highlight the entire word when searching for it
        set gdefault        "applies substitutions globally on lines"
        nmap <silent> ,/ :nohlsearch<CR>

    "Showing matching brackets
        set showmatch
        hi MatchParen cterm=underline ctermbg=green ctermfg=blue

    "Changing the place where the new default window opens
        set splitbelow
        set splitright

    "Split navigation's
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>

    "History and undo
        set history=1000         " remember more commands and search history
        set undolevels=1000      " use many levels of undo

    "Persistent undo
        set undofile                " Save undo after file closes
        set undodir=$HOME/.vim/undo " where to save undo histories
        set undolevels=1000         " How many undo
        set undoreload=10000        " number of lines to save for undo

    "Make the 81st column stand out
        highlight ColorColumn ctermbg=black
        call matchadd('ColorColumn', '\%81v', 100)

    "Indent properly based on the current file
        filetype indent on
        filetype plugin on

    "Tab's and spaces
        set tabstop=4     " a tab is four spaces
        set backspace=indent,eol,start
                          " allow backspacing over everything in insert mode
        set autoindent    " always set auto indenting on
        set copyindent    " copy the previous indentation on auto indenting
        set shiftwidth=4  " number of spaces to use for auto indenting
        set shiftround    " use multiple of shift width when indenting with
                		  " '<' and '>'
        set expandtab
        set shiftwidth=4
        set smarttab      " insert tabs on the start of a line according to
                          " shiftwidth, not tabstop set softtabstop=4

    "Easier moving of code blocks
        " Try to go into visual mode (v), then select several lines of code here and
        " then press ``>`` several times.
        vnoremap < <gv  " better indentation
        vnoremap > >gv  " better indentation

    "Setting the width of document
        set tw=79
        set nowrap  " don't automatically wrap on load
        set fo-=t   " don't automatically wrap text when typing

    "UTF8 Support
        set encoding=utf-8

    "Enable folding with the spacebar
        nnoremap <space> za

    "Enable folding
        set foldmethod=indent
        set foldlevel=99

    "Delete trailing spaces on write
        augroup delete_white_space
            au!
            autocmd BufWritePre * %s/\s\+$//e
        augroup END

    " Use Ag over Grep
        if executable('ag')
            set grepprg=ag\ --nogroup\ --nocolor
        endif

    ""Very magic mode
        "noremap / /\v

    "faster redrawing
        set ttyfast

    "screen rendering in buffers
        set lazyredraw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""""""""""""""""
so $HOME/dotfiles/vim/plugins.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
