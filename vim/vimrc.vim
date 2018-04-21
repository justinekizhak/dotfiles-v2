"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "   JUSTINE THOMAS
    "   Date: 17 April 2018
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""COMMON SETTINGS START"""""""""""""""""""""""""""""
    "Automatic reloading of .vimrc
        " autocmd! bufwritepost .vimrc source %
        autocmd! bufwritepost ~/dotfiles/vim/vimrc.vim source ~/dotfiles/vim/vimrc.vim   

    " Set font according to system
    if has("mac") || has("macunix")
        set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
    elseif has("win16") || has("win32")
        set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
    elseif has("gui_gtk2")
        set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
    elseif has("linux")
        set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
    elseif has("unix")
        set gfn=Monospace\ 11
    endif

    "Setting leader key
        let mapleader = ","

    "Need to set this flag on in order to have many cool features on
        set nocompatible
 
    "Syntax hightlighting by default
        syntax on

    "Numbering and relative numbering
        set number
        set relativenumber

    "Quick editing of vimrc
        map <leader>e :e! ~/dotfiles/vim/vimrc.vim<cr>

    " yank to clipboard
    if has("clipboard")
        set clipboard=unnamed " copy to the system clipboard

        if has("unnamedplus") " X11 support
            set clipboard+=unnamedplus
        endif
    endif
    
    "Working directory 
    if has('unix')
        cd ~/
    endif
    if has('macunix')
        cd ~/MEGA/coding/
    endif

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
        filetype indent on
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
            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$|backup',
                \ 'file': '\.so$\|\.dat$|\.DS_Store$'
                \ }
                set wildignore+=*/tmp/*,*.so,*.swp,*.zip,~/Library/*
                " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
                if executable('ag')
                    " Use Ag over Grep
                    set grepprg=ag\ --nogroup\ --nocolor
                    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
                    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                    " ag is fast enough that CtrlP doesn't need to cache
                    let g:ctrlp_use_caching = 0
                endif
                let g:ctrlp_working_path_mode = 'ra'
                let g:ctrlp_cache_dir = $HOME.'/.vim/.cache/ctrlp'
                let g:ctrlp_match_window_reversed = 1
                let g:ctrlp_clear_cache_on_exit=0
                let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

        "4)vim-tmux
           Plugin 'christoomey/vim-tmux-navigator.git' 

        "5) ale
            Plugin 'w0rp/ale'

        "5) vim-repeat. required for easyclip
            Plugin 'tpope/vim-repeat.git'

        "6) Easyclip for copy pasting in vim
            Plugin 'svermeulen/vim-easyclip'
    "==========================================================================
        ""All of your Plugins must be added before the following line
        call vundle#end()            " required
        filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
