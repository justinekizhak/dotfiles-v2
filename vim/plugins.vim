"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "   Created by:         JUSTINE THOMAS
    "   Created:            Fri 27 Apr 2018 12:37:41 PM IST
    "   Last Modified:      Thu 03 May 2018 02:21:45 PM IST
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
        "1) CommandT better file search
            Plugin 'wincent/command-t'
            nmap <silent> <Leader>T <Plug>(CommandT)
            nmap <silent> <Leader>b <Plug>(CommandTBuffer)
            nmap <silent> <Leader>j <Plug>(CommandTJump)

        "2)YouCompleteMe code completion
            Plugin 'Valloric/YouCompleteMe'
            "Youcompleteme fix
            let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
            noremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
    "==========================================================================
        "All of your Plugins must be added before the following line
            call vundle#end()            " required
            filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""VIM-PLUG SETTINGS"""""""""""""""""""""""""""""""""
call plug#begin()
    "3) Airline status bar
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        let g:airline_theme='solarized'
        "powerline symbols
            let g:airline_left_sep = ''
            let g:airline_right_sep = ''

    "4)NERDTree
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        map <C-n> :NERDTreeToggle<CR>
        let NERDTreeQuitOnOpen=1

    "5)better vim-tmux navigation
        Plug 'christoomey/vim-tmux-navigator'

    "6)Ale code linting
        Plug 'w0rp/ale'
        "Set this in your vimrc file to disabling highlighting
            let g:ale_set_highlights = 0
        "Set this. Airline will handle the rest.
            let g:airline#extensions#ale#enabled = 1
        highlight clear ALEErrorSign
        highlight clear ALEWarningSign

    "7) vim-repeat. required for easyclip
        Plug 'tpope/vim-repeat'

    "8) Easyclip for copy pasting in vim
        Plug 'svermeulen/vim-easyclip'

    "9)AutoPairs auto inserting brackets
        Plug 'jiangmiao/auto-pairs'

    "10)Timestamp
        Plug 'vim-scripts/timestamp.vim'

    "11)UltiSnips snippets
        "Track the engine.
            Plug 'SirVer/ultisnips'
        "Snippets are separated from the engine. Add this if you want them:
            Plug 'honza/vim-snippets'
        "If you want :UltiSnipsEdit to split your window.
            let g:UltiSnipsEditSplit="vertical"

    "12)SuperTabs for better integration of ycm and ultisnips
        Plug 'ervandew/supertab'
        "make YCM compatible with UltiSnips (using supertab)
            let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
            let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
            let g:SuperTabDefaultCompletionType = '<C-n>'
        "better key bindings for UltiSnipsExpandTrigger
            let g:UltiSnipsExpandTrigger = "<c-space>"
            let g:UltiSnipsJumpForwardTrigger = "<tab>"
            let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    "13)highlight text as they are typed
        Plug 'osyo-manga/vim-over'
        map <leader>r :OverCommandLine<CR>s/

    "14)git diff
        Plug 'airblade/vim-gitgutter'

    "15)Show vim undo tree
        Plug 'simnalamburt/vim-mundo'
        map <leader>u :MundoToggle<CR>

    "16)Show indent line
        Plug 'Yggdroot/indentLine'

    "17)Show tagbar on right side
        Plug 'majutsushi/tagbar'
        nnoremap <leader>t :TagbarToggle<CR>

    "18)Use ag
        Plug 'brookhong/ag.vim'
        "cnoreabbrev Ack Ack!
        nnoremap <Leader>s :Ag!<Space>

    "19)Buffer explorer
        Plug 'jlanzarotta/bufexplorer'

    "20)Renamer bulk rename plugin
        Plug 'qpkorr/vim-renamer'

    "21)Fugitive for git integration
        Plug 'tpope/vim-fugitive'

    "22)Sourrounding with parenthesis
        Plug 'tpope/vim-surround'

    "23)For commenting lines
        Plug 'scrooloose/nerdcommenter'

    "24)Vim motion on speed
        Plug 'easymotion/vim-easymotion'

    "25)Use multiple cursors like in sublime text
        Plug 'terryma/vim-multiple-cursors'
        let g:multi_cursor_use_default_mapping=0
        " Default mapping
        let g:multi_cursor_start_word_key      = '<C-m>'
        let g:multi_cursor_select_all_word_key = '<A-n>'
        let g:multi_cursor_start_key           = 'g<C-m>'
        let g:multi_cursor_select_all_key      = 'g<A-n>'
        let g:multi_cursor_next_key            = '<C-m>'
        let g:multi_cursor_prev_key            = '<C-p>'
        let g:multi_cursor_skip_key            = '<C-x>'
        let g:multi_cursor_quit_key            = '<Esc>'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
