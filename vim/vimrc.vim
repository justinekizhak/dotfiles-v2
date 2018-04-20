"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "   JUSTINE THOMAS
    "   Date: 17 April 2018
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""COMMON SETTINGS START"""""""""""""""""""""""""""""
    "Automatic reloading of .vimrc
        autocmd! bufwritepost .vimrc source %
    
    "Need to set this flag on in order to have many cool features on
        set nocompatible
 
    "Syntax hightlighting by default
        syntax on

    "Numbering and relative numbering
        set number
        set relativenumber
    
    " yank to clipboard
    if has("clipboard")
        set clipboard=unnamed " copy to the system clipboard

        if has("unnamedplus") " X11 support
            set clipboard+=unnamedplus
        endif
    endif
    
    "Working driectory
        cd ~/

    "Show search matches as you type
        set incsearch
    
    "Highlight the entire word when searching for it
        set hlsearch
    
    "Showing matching brackets
        set showmatch
    
    "Changing the place where the new default window opens
        set splitbelow
        set splitright
    
    "Split navigations
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>
    
    "History and undo's
        set history=1000         " remember more commands and search history
        set undolevels=1000      " use many levels of undo
    
    "Persistent undo
        set undofile                " Save undo's after file closes
        set undodir=$HOME/.vim/undo " where to save undo histories
        set undolevels=1000         " How many undos
        set undoreload=10000        " number of lines to save for undo
    
    "====[ Make the 81st column stand out ]====================
        highlight ColorColumn ctermbg=black
        call matchadd('ColorColumn', '\%81v', 100)
    
    "Indent properly based on the current file
        filetype indent plugin on
        filetype plugin on
    
    "Tab's and spaces
        set tabstop=4     " a tab is four spaces
        set backspace=indent,eol,start
                          " allow backspacing over everything in insert mode
        set autoindent    " always set autoindenting on
        set copyindent    " copy the previous indentation on autoindenting
        set shiftwidth=4  " number of spaces to use for autoindenting
        set shiftround    " use multiple of shiftwidth when indenting with 
                		  " '<' and '>'
        set expandtab
        set shiftwidth=4
        set softtabstop=4
    
    "Easier moving of code blocks
        " Try to go into visual mode (v), thenselect several lines of code here and
        " then press ``>`` several times.
        vnoremap < <gv  " better indentation
        vnoremap > >gv  " better indentation
    
    "Showing line numbers and length
        set tw=79   " width of document (used by gd)
        set nowrap  " don't automatically wrap on load
        set fo-=t   " don't automatically wrap text when typing
    
    "No more annoying sounds
        "set visualbell
    
    "UTF8 Support
        set encoding=utf-8
    
    "Enable folding with the spacebar
        nnoremap <space> za
    "Enable folding
        set foldmethod=indent
        set foldlevel=99

    "Select all keymaping
        map <C-a> <esc>ggVG<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""VUNDLE SETTINGS"""""""""""""""""""""""""""""""""""
        "required
        filetype off                  
        
        "set the runtime path to include Vundle and initialize
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        
        "Installing Vundle
        Plugin 'VundleVim/Vundle.vim'

        ""Add all your plugins below (note older versions of Vundle used Bundle instead of Plugin)
    "==========================================================================
        "1) Airline status bar
            Plugin 'vim-airline/vim-airline'
            Plugin 'vim-airline/vim-airline-themes'

        "2)NERDTree
            Plugin 'scrooloose/nerdtree'
            map <C-n> :NERDTreeToggle<CR>

        "3)ctrl-p fuzzy file search
            Plugin 'ctrlpvim/ctrlp.vim.git'

        "4)vim-tmux
           Plugin 'christoomey/vim-tmux-navigator.git' 
    "==========================================================================
        ""All of your Plugins must be added before the following line
        call vundle#end()            " required
        filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
