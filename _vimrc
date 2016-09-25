set nocompatible

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 让配置变更立即生效
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

"Fast reloading of the .vimrc
map <silent> <leader>ss :source $MYVIMRC<cr>
map <silent> <leader>ee :e $MYVIMRC<cr>

"显示行号
set nu!
"配色
colorscheme desert 
"使能语法
syntax enable 
syntax on
"设置字体
set guifont=Consolas:h14::cDEFAULT

"修改默认语言
let $LANG = 'en'  "set message language  
set langmenu=en   "set menu's language of gvim. no spaces beside '=' 
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"配置多语言环境,解决中文乱码问题
if has("multi_byte") 
    " UTF-8 编码 
    set encoding=utf-8 
    set termencoding=utf-8 
    set formatoptions+=mM 
    set fencs=utf-8,gbk 
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)' 
        set ambiwidth=double 
    endif 
    if has("win32") 
        source $VIMRUNTIME/delmenu.vim 
        source $VIMRUNTIME/menu.vim 
        language messages zh_CN.utf-8 
    endif 
else 
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte" 
endif

"配置ctags，实现程序跳转
set tags=tags; 
set autochdir

"ctags键绑定CTRL+F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>


"配置taglist
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
"map <silent> <F9> :TlistToggle<cr>

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='FileExplorer|TagList' 
nmap wm :WMToggle<cr>

"grep
nnoremap <silent> <F3> :Grep<CR>
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr> 

"切换头文件
nnoremap <silent> <F12> :A<CR> 

if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果(有时候报错：--no lines in buffer--)
    "set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
    "在当前目录中添加任何数据库
    if filereadable("cscope.out")
        cs add cscope.out
    "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    "快捷键设置
    nmap <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <Leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /

"Smart way to move btw. window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""
" => Minibuffer
""""""""""""""""""""""""""""""
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplModSelTarget = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1

let g:miniBufExplMapCTabSwitchBufs=1 
let g:miniBufExplMapWindowsNavVim=1 
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplorerMoreThanOne=0

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
"let g:bufExplorerDefaultHelp=0       " Do not show default help.
"let g:bufExplorerShowRelativePath=1  " Show relative paths.
"let g:bufExplorerSortBy='mru'        " Sort by most recently used.
"let g:bufExplorerSplitRight=0        " Split left.
"let g:bufExplorerSplitVertical=1     " Split vertically.
"let g:bufExplorerSplitVertSize = 30  " Split width
"let g:bufExplorerUseCurrentWindow=1  " Open in new window.
"autocmd BufWinEnter \[Buf\ List\] setl nonumber 

""""""""""""""""""""""""""""""
" mark setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex 


filetype plugin indent on 


