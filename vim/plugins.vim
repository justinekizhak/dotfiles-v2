"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "   Created by:         JUSTINE THOMAS
    "   Created:            Fri 27 Apr 2018 12:37:41 PM IST
    "   Last Modified:      Wed 02 May 2018 10:53:56 PM IST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Automatic reloading of .vimrc
        autocmd! bufwritepost ~/dotfiles/vim/plugins.vim source ~/dotfiles/vim/plugins.vim

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

        "3)better vim-tmux navigation
           Plugin 'christoomey/vim-tmux-navigator.git'

        "4)Ale code linting
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

        "7) CommandT better file search
            Plugin 'wincent/command-t'

        "8)YouCompleteMe code completion
            Plugin 'Valloric/YouCompleteMe'
            "Youcompleteme fix
            let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
            noremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

        "9)AutoPairs auto inserting brackets
            Plugin 'jiangmiao/auto-pairs.git'

        "10)Timestamp
            Plugin 'vim-scripts/timestamp.vim'

        "11)UltiSnips snippets
            " Track the engine.
                Plugin 'SirVer/ultisnips'
            " Snippets are separated from the engine. Add this if you want them:
                Plugin 'honza/vim-snippets'
            " If you want :UltiSnipsEdit to split your window.
                let g:UltiSnipsEditSplit="vertical"

        "12)SuperTabs for better integration of ycm and ultisnips
            Plugin 'ervandew/supertab'
            " make YCM compatible with UltiSnips (using supertab)
                let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
                let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
                let g:SuperTabDefaultCompletionType = '<C-n>'
            " better key bindings for UltiSnipsExpandTrigger
                let g:UltiSnipsExpandTrigger = "<c-space>"
                let g:UltiSnipsJumpForwardTrigger = "<tab>"
                let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

        "13)highlight text as they are typed
            Plugin 'osyo-manga/vim-over.git'
            map <leader>r :OverCommandLine<CR>s/

        "14)git diff
            Plugin 'airblade/vim-gitgutter'

        "15)Show vim undo tree
            Plugin 'simnalamburt/vim-mundo.git'
            map <leader>u :MundoToggle<CR>

        "16)Show indent line
            Plugin 'Yggdroot/indentLine'

        "17)Show tagbar on right side
            Plugin 'majutsushi/tagbar'
            nnoremap <leader>t :TagbarToggle<CR>

        "18)Use ag
            Plugin 'brookhong/ag.vim'
            "cnoreabbrev Ack Ack!
            nnoremap <Leader>s :Ag!<Space>

        "19)Buffer explorer
            Plugin 'jlanzarotta/bufexplorer'

        "20)Renamer bulk rename plugin
            Plugin 'qpkorr/vim-renamer'

        "21)Fugitive for git integration
            Plugin 'tpope/vim-fugitive'

        "22)Sourrounding with parenthesis
            Plugin 'tpope/vim-surround'

        "23)For commenting lines
            Plugin 'scrooloose/nerdcommenter'

        "24)Vim motion on speed
            Plugin 'easymotion/vim-easymotion'

        "25)Use multiple cursors like in sublime text
            Plugin 'terryma/vim-multiple-cursors'
    "==========================================================================
        "All of your Plugins must be added before the following line
            call vundle#end()            " required
            filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
