set nocompatible
filetype off
syntax on
filetype plugin indent on

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'jooize/vim-colemak'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'wfxr/minimap.vim'
Plug 'romgrk/barbar.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'itchyny/lightline.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'chriskempson/base16-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'andweeb/presence.nvim'

Plug 'karb94/neoscroll.nvim'
Plug 'glepnir/dashboard-nvim'

call plug#end()

set nowrap
set formatoptions-=t

set modelines=0

set number

set ruler

set visualbell

set encoding=utf-8

set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=4
set softtabstop=2
set expandtab
set noshiftround

set noshowmode 

set timeoutlen=1000

" Base vim rebinds
inoremap NE <Esc>
tnoremap <Esc> <C-\><C-n>
nnoremap <Space> @q

syntax enable
colorscheme base16-default-dark

" Italicise specific kwargs (I know its not best practice but I personally do
" not care at all)
hi Comment      gui=italic cterm=italic
hi htmlArg      gui=italic cterm=italic guifg=#7cafc2
hi htmlItalic   gui=italic cterm=italic guifg=15

hi Title        guifg=15
hi Keyword      gui=italic cterm=italic


let base16colorspace=256

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Nvim Tree Setup
let g:open_on_setup = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:auto_close = 1 "0 by default, closes the tree when it's the last window
let g:auto_ignore_ft = [ 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:quit_on_open = 0
let g:follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:open_on_tab = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

" Minimap configuration
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_block_filetypes = ['nvimtree', 'barbar', 'telescope']

" Bar-bar keybindings
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-w> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them

lua require'nvim-tree'.setup {}

" Dashboard quick setup
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC t c',
\ 'find_word'          : 'SPC f a',
\ 'book_marks'         : 'SPC f b',
\ }
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" Indent-blankline setup
" let g:indent_blankline_filetype_exclude = ['dashboard', 'telescope']

" Emmet setup
let g:user_emmet_leader_key = '<C-e>'

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


" cd C:/Users/bobja/OneDrive/Desktop/Everything/code
