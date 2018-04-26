"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "   Created by:         JUSTINE THOMAS
    "   Last Modified:      Thu 26 Apr 2018 05:21:10 PM IST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""COMMON SETTINGS"""""""""""""""""""""""""""""""""""
    "Automatic reloading of .vimrc
        autocmd! bufwritepost ~/dotfiles/vim/vimrc.vim source ~/.vimrc

    "Setting leader key
        let mapleader = ","

    "Need to set this flag on in order to have many cool features on
        set nocompatible

    "Spellcheck for vim
        autocmd FileType latex,tex,md,markdown setlocal spell
        set spelllang=en_us
        set spellfile=~/dotfiles/vim/en.utf-8.add

    "Syntax highlighting by default
        syntax on

    "Numbering and relative numbering
        set number
        set relativenumber

    "Quick editing of vimrc
        map <leader>e :e! ~/dotfiles/vim/vimrc.vim<cr>

    "Yank to clipboard
        if has("clipboard")
            set clipboard=unnamed " copy to the system clipboard
            if has("unnamedplus") " X11 support
                set clipboard+=unnamedplus
            endif
        endif

    "Working directory
        if has('unix')      "this will be your working directory
            cd ~/           "if your OS is Linux
        endif               "Please change these values for yourself
        if has('macunix')   "if its macOS then
            cd ~/MEGA/      "this will be your directory
        endif

    "Show search matches as you type
        set incsearch

    "Highlight the entire word when searching for it
        set hlsearch

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
        set softtabstop=4

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

    "Ctrl-a to select all text
        map <C-a> <esc>ggVG<CR>

    "Delete trailing spaces on write
        if has("autocmd")
            autocmd BufWritePre * %s/\s\+$//e
        endif

    " Use Ag over Grep
        if executable('ag')
            set grepprg=ag\ --nogroup\ --nocolor
        endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""VUNDLE SETTINGS"""""""""""""""""""""""""""""""""""
        "required
            filetype off

        "set the runtime path to include Vundle and initialize
            set rtp+=~/.vim/bundle/Vundle.vim
            call vundle#begin()

        "Installing Vundle
            Plugin 'VundleVim/Vundle.vim'

        "Add all your plugins below (note older versions of Vundle used Bundle instead of Plugin)
    "==========================================================================
        "1) Airline status bar
            Plugin 'vim-airline/vim-airline'
            Plugin 'vim-airline/vim-airline-themes'
            let g:airline_theme='solarized'
           " powerline symbols
                let g:airline_left_sep = ''
                let g:airline_right_sep = ''

        "2)NERDTree
            Plugin 'scrooloose/nerdtree'
            map <C-n> :NERDTreeToggle<CR>
            let NERDTreeQuitOnOpen=1

        "3)vim-tmux
           Plugin 'christoomey/vim-tmux-navigator.git'

        "4) ale
            Plugin 'w0rp/ale'
            " Set this in your vimrc file to disabling highlighting
                let g:ale_set_highlights = 0
            " Set this. Airline will handle the rest.
                let g:airline#extensions#ale#enabled = 1
            highlight clear ALEErrorSign
            highlight clear ALEWarningSign

        "5) vim-repeat. required for easyclip
            Plugin 'tpope/vim-repeat.git'

        "6) Easyclip for copy pasting in vim
            Plugin 'svermeulen/vim-easyclip'

        "7) CommandT
            Plugin 'wincent/command-t'

        "8)YouCompleteMe
            Plugin 'Valloric/YouCompleteMe'
            "Youcompleteme fix
            let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

        "9)AutoPairs
            Plugin 'jiangmiao/auto-pairs.git'

        "10)Timestamp
            Plugin 'vim-scripts/timestamp.vim'

        "11)UltiSnips
            " Track the engine.
                Plugin 'SirVer/ultisnips'
            " Snippets are separated from the engine. Add this if you want them:
                Plugin 'honza/vim-snippets'
            " If you want :UltiSnipsEdit to split your window.
                let g:UltiSnipsEditSplit="vertical"

        "12)SuperTabs
                Plugin 'ervandew/supertab'
            " make YCM compatible with UltiSnips (using supertab)
                let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
                let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
                let g:SuperTabDefaultCompletionType = '<C-n>'
            " better key bindings for UltiSnipsExpandTrigger
                let g:UltiSnipsExpandTrigger = "<c-space>"
                let g:UltiSnipsJumpForwardTrigger = "<tab>"
                let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    "==========================================================================
        "All of your Plugins must be added before the following line
            call vundle#end()            " required
            filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
