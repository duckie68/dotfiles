"
"  _   _         __     ___
" | \ | | ___  __\ \   / (_)_ __ ___
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
" | |\  |  __/ (_) \ V / | | | | | | |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
let mapleader =" "

" Plugins

call plug#begin('~/.vim/plugged')
Plug 'dpelle/vim-LanguageTool'		" pacman -S languagetool
Plug 'rhysd/vim-grammarous'		" grammar checker
Plug 'ron89/thesaurus_query.vim'	" thesaurus rex
Plug 'kblin/vim-fountain'		" syntax highlighting for fountain
call plug#end()

" Some basics
	set nocompatible
	filetype plugin indent on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set fo+=t
	set fo-=l
	set tw=79
	set path+=**

" Enable autocompletion
	set wildmenu
	set wildmode=longest,list,full

" Disable autocommenting
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Sensible splits
	set splitbelow splitright

" Sensible split navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Use URLscan to choose and open an URL
	:noremap <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
	:noremap ,, !urlscan -r 'linkhandler {}'<CR>

" Using system clipboard
	vnoremap <C-c> "+y
	map <C-p> "+p

" Automagically delete trailing whitespaces
	autocmd BufWritePre * %s/\s\+$//e

" When shortcuts are updated, renew bash and Ranger
	autocmd BufWritePost ~/.bm* !shortcuts

" Run xrdb when Xdefaults or Xresources is updated
	autocmd BufWritePost ~/.Xresources, ~/.Xdefaults !xrdb %

" Compile document
	map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" TEMPLATE SHORTCUTS
" __________________

" Format is
" nnoremap ,html :-1read $HOME/.templates/template.file<CR><movements>

" Screenplay template
nnoremap ,screen :-1read $HOME/.templates/screenplay.fountain<CR>5j$:put =strftime('%F')<CR>i<BS><Space><ESC>ggj4li

" Jekyll template
nnoremap ,jekyll :-1read $HOME/.templates/jekyll.md<CR>jw3li

" PLUGIN SETTINGS
" ---------------

" source local help file with ':helptags ~/.config/nvim/doc'

" Languagetool
let g:languagetool_jar='usr/share/java/languagetool/languagetool-commandline.jar'
" Usage
" :LanguageToolCheck to check grammar in current buffer
" :LanguageToolClear  to remove highlighting and clear scratch window
" :help LanguageTool

" Grammarous
" Usage
" :GrammarousCheck to check grammar
" :GrammarousReset to reset
" q quits info window
" <CR> move to location of error
" f fixes error
" n next error
" p previous error
" ? help

" Thesaurus_query
	" nnoremap <Leader>cs :ThesaurusQueryReplaceCurrentWord<CR>
	" vnoremap <Leader>cs y:ThesaurusQueryReplace <C-r><CR>
" Usage
" Replace words or phrases
" :Thesaurus your phrases

" Netrw - built in file browser - hit ':edit ."
" <CR>/v/t open in h-split, v-split, or tab
" check |netrw-browse-maps|
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
