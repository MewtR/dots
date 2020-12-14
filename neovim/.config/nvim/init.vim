"neovim

set background=dark
" Use light background for papercolor
"set background=light

"vim plug config
call plug#begin('~/.config/nvim/plugged')
"Install fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Bracket operations
"Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
"Git wrapper
Plug 'tpope/vim-fugitive'

"Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Use ccls for cpp highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight'

"Sxhkd config file syntax
Plug 'kovetskiy/sxhkd-vim'

"Themes
"gruvbox theme
Plug 'morhetz/gruvbox'
"FlatColor theme
Plug 'MaxSt/FlatColor'
"Onedark theme
Plug 'joshdick/onedark.vim'
"janah theme
Plug 'mhinz/vim-janah'
"Dracula
Plug 'dracula/vim', { 'as': 'dracula' }
"Paper color 
Plug 'NLKNguyen/papercolor-theme'
"Night owl
Plug 'haishanh/night-owl.vim'

"Vim wiki
Plug 'vimwiki/vimwiki'

call plug#end()

"deoplete at startup
"let g:deoplete#enable_at_startup = 1

"gruvbox options
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

" Onedark options
let g:onedark_terminal_italics=1

"Night owl options
let g:lightline = { 'colorscheme': 'nightowl'}

"Enable true colors (not sure if this works yet)
if (has("termguicolors"))
 set termguicolors
endif
"Status line taken from Junegunn
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

"Sandwich config
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

"echodoc
"let g:echodoc#enable_at_startup = 1
"colorscheme gruvbox
"colorscheme flatcolor
"colorscheme onedark
"colorscheme janah
"colorscheme dracula
"colorscheme PaperColor
colorscheme night-owl


"Global settings
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set number
"set relativenumber
set numberwidth=1
"Search down into subfolders
"Provides tab-completion for all file-related tasks
set path+=**
set virtualedit=onemore
set completeopt-=preview " disable ugly ass preview window
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.config/nvim/undo

"Cursor options
"Correct cursor shapre on when exiting neovim
"horizontal curosr (underline)
":au VimLeave * set guicursor=a:hor50-blinkwait700-blinkoff400-blinkon250
"block curosr 
":au VimLeave * set guicursor=a:block-blinkwait700-blinkoff400-blinkon250

"Save cursor position
augroup resCur
      autocmd!
      autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"Mappings
let mapleader = ","
let maplocalleader = "\\"
"<cr> is carriage return (enter)
:nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
:nnoremap <leader>sv :source $MYVIMRC<cr>


"Escape in terminal mode
:tnoremap <Esc> <C-\><C-n>

"Split lines with capital K
:nnoremap K i<CR><Esc>

"Insert lines with enter
:nnoremap <CR> $a<CR><Esc>
"Use space in normal mode
:nnoremap <Space> i<Space><Esc>l



"Switching between windows
:nnoremap <leader>h <c-w>h
:nnoremap <leader>j <c-w>j
:nnoremap <leader>k <c-w>k
:nnoremap <leader>l <c-w>l
"Only works with 2 windows, exchanges 
"their place
:nnoremap <leader>x <c-w>x
:nnoremap <leader>o <c-w>o
:nnoremap <leader>w <c-w><c-w>
"evens the split panel size (useful when
"resizing the terminal)
:nnoremap <leader>= <c-w>=

"Reszing windows (alt+ something)
nnoremap <M-h> <C-w><
nnoremap <M-j> <C-w>-
nnoremap <M-k> <C-w>+
nnoremap <M-l> <C-w>>

"Redraw cursor at the center of the screen in insert mode (zz in normal mode)
:inoremap <c-z> <esc>zza
"Can be done with surround plugin
"Wrap visually selected text in double quotes
:vnoremap <leader>" <esc>a"<esc>`<i"<esc>`>lll
"Wrap visually selected text in single quotes
:vnoremap <leader>' <esc>a'<esc>`<i'<esc>`>lll
"Wrap visually selected text in parentheses quotes
:vnoremap <leader>) <esc>a )<esc>`<i( <esc>`>lllll
"Wrap visually selected text in curly braces
:vnoremap <leader>} <esc>a}<esc>`<i{ <esc>`>lllll
"jk to esc insert mode
:inoremap jk <esc>
"jj to skip closing bracket
:inoremap jj <esc>la

"Doesn't work for now -------------------
" " Copy to clipboard
vnoremap  <leader>y  "+y
" not sure what next one does
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
"Doesn't work for now -------------------

"Fzf keybindings
"Finging files
:nnoremap <leader>f :Files<CR>

"Preview window for Files command with bat
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"Finging files and open in horizontal window
:nnoremap <leader>sf :split<CR> :Files<CR>
"Finging files and open in vertical window
:nnoremap <leader>vf :vsplit<CR> :Files<CR>
"Finging buffers
:nnoremap <leader>b :Buffers<CR>
"Finging buffers and open in horizontal window
:nnoremap <leader>sb :split<CR> :Buffers<CR>
"Finging buffers and open in vertical window
:nnoremap <leader>vb :vsplit<CR> :Buffers<CR>
"Finging tags
:nnoremap <leader>t :Tags<CR>
"Searching inside files
:nnoremap <leader>a :Ag<CR>

"Preview window for Ag command with bat
command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview() ,<bang>0)
"Viewing normal mode mappings
:nnoremap <leader>m :Maps<CR>

"Fugitive key bindings
:nnoremap <leader>gs :Gstatus<CR>gg<C-n>
"See difference between current file (modified) and file before 
"modification
:nnoremap <leader>vg :Gvdiff<CR>
"git add current file
:nnoremap <leader>gw :Gwrite<CR>
"git checkout current file (return it to the way it was before modification)
:nnoremap <leader>gr :Gread<CR>
"commit
:nnoremap <leader>gc :Gcommit<CR>
"blame
:nnoremap <leader>gb :Gblame<CR>
"git remove
:nnoremap <leader>gr :Gdelete<CR>


"Autocommad for commenting lines out in css
:autocmd FileType css,scss nnoremap <buffer> <localleader>c I/*<esc>A*/<esc>
"Autocommad for commenting lines out in ruby
:autocmd FileType ruby nnoremap <buffer> <localleader>c I#<esc>

"Some Buffer-Local abbrebiations (space gets inserted for abbreviations)
:autocmd FileType eruby,yaml :inoremap <buffer> << <%=  %><esc>F=la
:autocmd FileType eruby,yaml :inoremap <buffer> <> <%  %><esc>F%;la
:autocmd FileType ruby,eruby :inoremap <buffer> ## #{}<esc>hi
:autocmd FileType html,cpp,c :inoremap <buffer> <> <><esc>i


" Snippets 
" Read an empty html template and move cursor to the title
:nnoremap ,phtml :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a



"LVTHW
:noremap <leader>- ddp
:noremap <leader>_ ddkkp
"Change current word to uppercase
"in insert mode with control-u
:inoremap <c-u> <esc>gUiwea

"For annoying brackets and quotes I suppose
:inoremap (( ()<esc>i
:inoremap [[ []<esc>i
:inoremap {{ {}<esc>i
:inoremap '' ''<esc>i
:inoremap "" ""<esc>i
:inoremap `` ``<esc>i
"Should probably make this one FileType specific
":inoremap \|\| \|\|<esc>i


"Some abbreviations
:iabbrev waht what
:iabbrev tehn then

"Surrond a word in double quotes (cool but not very useful)
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
"Surrond a word in single quotes (cool but not very useful)
:nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel


"Coc from https://github.com/neoclide/coc.nvim
autocmd FileType json syntax match Comment +\/\/.\+$+

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

set updatetime=300 "Low values cause highlight glitches apparently (mine used to be set to 350)
"From https://github.com/MaskRay/ccls/wiki/coc.nvim
"sil means execute silently apparently
"au CursorHold * sil call CocActionAsync('highlight') pretty pointless
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
"au CursorHold * sil call CocLocationsAsync('ccls', '$ccls/publishSkippedRegions')
"au CursorHold * echo 'hello'
"au CursorHoldI * echo 'again'
"autocmd CursorHold * :syntax sync fromstart <- doesn't work

"ccls
" caller
"nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" callee
"nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

set shortmess+=c

set signcolumn=yes

" Better display for messages
set cmdheight=2

nmap <silent> <M-j> <Plug>(coc-definition)
nmap <silent> <C-,> <Plug>(coc-references)
" Remap keys for gotos
nmap  gd <Plug>(coc-definition)
nmap  gy <Plug>(coc-type-definition)
nmap  gi <Plug>(coc-implementation)
nmap  gr <Plug>(coc-references)

"highlight CocErrorHighlight ctermfg=Red 
highlight CocErrorSign  ctermfg=Red guifg=#ff4d4d
" Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index (['vim','help'],&filetype) >=0 )
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

"vimwiki config
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/wiki/',
            \ 'syntax': 'markdown', 'ext': '.md',
            \ 'path_html': '~/Documents/vimwiki/html'}]

"disabling some mappings to allow coc to do it's thing for tab completion
let g:vimwiki_key_mappings = { 'table_mappings': 0 }
