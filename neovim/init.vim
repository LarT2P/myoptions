"For Windows

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('C:/Users/abc1/AppData/Local/nvim/my_plugin')

"美化
Plug 'itchyny/lightline.vim'

"匹配跳转
Plug 'vim-scripts/matchit.zip'

"对齐
Plug 'junegunn/vim-easy-align'

"对齐线
Plug 'Yggdroot/indentLine'

"撤销树
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

"multiple selections
Plug 'terryma/vim-multiple-cursors'

"Highlights trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

"括号补全
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'

"Tag文件窗口
Plug 'vim-scripts/taglist.vim', { 'on':  'TlistToggle' }

"注释
Plug 'scrooloose/nerdcommenter'

"语言类
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

"快速打开文件
Plug 'ctrlpvim/ctrlp.vim'

"快速移动
Plug 'easymotion/vim-easymotion'

"快速执行终端指令
Plug 'skywind3000/asyncrun.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" common setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""
"General
""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set nobackup
set noswapfile
set history=1024

"自动设置当前目录为正在编辑的目录
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

set viminfo='100,n$HOME/.vim/files/info/viminfo
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim 的默认寄存器和系统剪贴板共享
set clipboard=unnamed
" 设置 alt 键不映射到菜单栏
set winaltkeys=no

"关闭提示音
set noeb
set vb t_vb=

""""""""""""""""""""""""""""""""""""""""""""
"Encoding
""""""""""""""""""""""""""""""""""""""""""""
set tenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
"解决consle输出乱码
language messages zh_CN.utf-8

""""""""""""""""""""""""""""""""""""""""""""
"GUI
""""""""""""""""""""""""""""""""""""""""""""
" 设定命令行的行数为 2
set cmdheight=1
set noshowmode
" 状态栏显示目前所执行的指令
set guifont=IBM\ Plex\ Mono\ 12
if has("gui_running")
    set lines=35 columns=100
endif

" 设置 laststatus = 0 ，不显式状态行
" 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
" 设置 laststatus = 2 ，总是显式状态行
set laststatus=2

" 使用指令变大变小
command! FontBigger :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! FontSmaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')

set cursorline
set cursorcolumn

if has("gui_running")
    " Switch on highlighting the last used search pattern.
    set hlsearch
else
    set t_Co=256
endif

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
set smartcase

set number

" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright

"不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b

" 出现问题时恢复文件
"交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
set directory="C:/Users/abc1/AppData/Local/nvim/files/swp/"
set undodir="C:/Users/abc1/AppData/Local/nvim/files/undodir/"
set undofile

" 监视文件改动
set autoread

" 命令模式下，底部操作指令按下 Tab 键自动补全。
" 第一次按下 Tab，会显示所有匹配的操作指令的清单；
" 第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full

""""""""""""""""""""""""""""""""""""""""""""
"Format
""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

filetype indent plugin on

"set foldmethod=marker
"关闭自动折叠
set nofoldenable


""""""""""""""""""""""""""""""""""""""""""""
"Key
""""""""""""""""""""""""""""""""""""""""""""
"set my leader
let mapleader=","

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>

" 定义退出模式快捷键
inoremap jk <ESC>

" 定义vim设置文件内容相关
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" 打开当前目录 explorer/cmd
nmap <silent> <leader>exp :!start explorer %:p:h<CR>
nmap <silent> <leader>cmd :!start cmd /k cd %:p:h<cr>

" 复制当前文件/路径到剪贴板
nmap <leader>cf :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
nmap <leader>cp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

" 快速交换当前行位置
nnoremap [l :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]l :<c-u>execute 'move +'. v:count1<cr>

" 快速添加空行
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" 设定n始终为向后，N始终为向前
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" 如果你选中了一行或多行，那么你可以用 < 或 > 来调整他们的缩进。但在调整之后就不会保持选中状态了。
" 你可以连续按下 g v 来重新选中他们，请参考 :h gv。因此，你可以这样来配置映射：
xnoremap < <gv
xnoremap > >gv

" 高级版本的重新绘制屏幕
" 这个映射就是执行重新绘制，并且取消通过 / 和 ? 匹配字符的高亮，而且还可以修复代码高亮问题
"（有时候，由于多个代码高亮的脚本重叠，或者规则过于复杂，Vim 的代码高亮显示会出现问题）。
" 不仅如此，还可以刷新「比较模式」
nnoremap <leader>rd :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" 一键运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! %<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! %<"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'sh'
        :!%
    endif
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"美化
""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme desert

"lightline
""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \ },
      \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

"对齐
""""""""""""""""""""""""""""""""""""""""""""
" 快速对齐
" ,a= 对齐等号表达
" ,a: 对齐冒号表达式(json/map等)
" # 默认左对齐
" ,a<space> 首个空格对齐
" ,a2<space> 第二个空格对齐
" ,a-<space> 倒数第一个空格对齐
" ,a-2<space> 倒数第二个空格对齐
" ,a*<space> 所有空格依次对齐
" # 右对齐
" ,a<Enter>*<space>

vnoremap <silent> <Enter> :EasyAlign<cr>
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = {
\ 'pattern': '#', 'ignore_groups': ['String']
\ }

"对齐线
"""""""""""""""""""""""""""""""""""""""""""""
" Vim
let g:indentLine_color_term = 239
" GVim
let g:indentLine_color_gui = '#A4E57E'

"撤销树
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ut :UndotreeToggle<cr>

"multiple selections
""""""""""""""""""""""""""""""""""""""""""""
" 关闭默认匹配
let g:multi_cursor_use_default_mapping=0
" 自定义匹配
let g:multi_cursor_next_key='<leader>mn'
let g:multi_cursor_prev_key='<leader>mp'
let g:multi_cursor_skip_key='<leader>ms'
let g:multi_cursor_quit_key='<Esc>'

"Highlights trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tw :FixWhitespace<cr>

"taglist
"""""""""""""""""""""""""""""""""""""""""""
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
" let Tlist_Show_One_File = 1
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Use_Right_Window = 1
"在右侧窗口中显示taglist窗口
nmap <leader>tl :TlistToggle<cr>

"注释
""""""""""""""""""""""""""""""""""""""""""""
"<leader>cc 加注释
"<leader>cu 解开注释
"<leader>c<space> 加上/解开注释, 智能判断
"<leader>cy 先复制, 再注解(p可以进行黏贴)

" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

"全局搜索
""""""""""""""""""""""""""""""""""""""""""""
" <leader>vv 可以在当前目录下全局搜索指针选择的单词
" 例如我们要全局搜索一段字符串str-star，可以在可视模式下通过光标移动选择该字符串，
" 之后按下快捷键 <leader>vv，即完成字符串的搜索，很方便
" 当然，我们也可以直接进行全局搜索，使用指令
" :Grep 搜索字符串
" 全局替换也可以
" :Replace [target] [replacement]

"快速打开文件
""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 使用vim的忽略文件
set wildignore+=*\\node_modules\\*,*.git*,*.svn*,*.zip*,*.exe*,*.pyc*,*.bin*,*.7z*,*.rar*

"快速移动
""""""""""""""""""""""""""""""""""""""""""""
" <leader><leader>w                       从光标位置起，往前（往下）在单词之间移动光标
" <leader><leader>b                       从光标位置起，往后（往上）在单词之间移动光标
" <leader><leader>s                       从光标位置起，同时往前往后，在单词之间移动光标
" <leader><leader>f｛char｝               从光标位置起，往前（往下）在单个字符之间移动光标

"彩虹括号
""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"vim-surround
""""""""""""""""""""""""""""""""""""""""""""
" 光标在
" “Hello world!”
" 中时按下cs"'，则会替换双引号为单引号：
" ‘Hello world!’
" 继续按下cs'<q>，则会替换单引号为 “标签”
" 'Hello world!'
" 按下cst"，则回到初始的双引号：
" “Hello world!”
" 要删除符号，则按下ds"
" Hello world!
" 当光标在hello上时，按下ysiw]，则会变为
" [Hello] world!
" 添加包围符号的命令是ys(ys可以记为you surround)，命令后同样跟两个参数，第一
" 个是一个vim“动作”（motion）或者是一个文本对象,其中motion即vim动作，比如说w
" 向后一个单词。文本对象简单的来说主要是来通过一些分隔符来标识一段文本，比如
" iw就是一个文本对象，即光标下的单词。
" 另外： yss 命令可以用于整行操作，忽略中间的空格,
" yS 和 ySS 还能让包围内容单独一行并且加上缩进。
" 加包围符号还有个非常好用的方式：在可视模式v下，按下S后即可添加想要添加的包围符号了。
" 再说一个小技巧：在包围符号为括时，输入左括号 (或者{ ,则会留一个空格

" 快速执行终端指令
let g:asyncrun_open = 8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           auto setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 针对python文件自动添加头部信息
func! SetTitle()
    call setline(1, "\#!/usr/bin/python")
    call setline(2, "\# -*- coding=utf8 -*-")
    call setline(3, "\"\"\"")
    call setline(4, "\# @Author : lart")
    call setline(5, "\# @Created Time : ".strftime("%Y-%m-%d %H:%M:%S"))
    call setline(6, "\# @Description : ")
    call setline(7, "\"\"\"")
    normal G
    normal o
    normal o
endfunc

" vim 文件折叠方式为 marker
augroup ft_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker

    autocmd bufnewfile *.py call SetTitle()

    " 打开文件总是定位到上次编辑的位置
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
