source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set nu
set ai!
syntax on
set cursorline
set tabstop=4
set showmatch
"继承前一行的缩进方式，特别适用于多行注释
set autoindent
set smartindent
filetype plugin indent on  
set completeopt=longest,menu "自动补全
"与windows共享剪贴板
set clipboard+=unnamed
"统一缩进为4
set softtabstop=4
set shiftwidth=4
colorscheme molokai  "solarized  molokai 
filetype plugin indent on  "启用filetype插件
let g:pydiction_location = 'D:\Program Files (x86)\Vim\vimfiles\ftplugin\pydiction\complete-dict' 
let g:pydiction_menu_height = 20 "设置弹出菜单的高度，默认是15

cd F:\shell


" python 编译
"python << EOF
"import time
"import vim
"def SetBreakpoint():
"    strLine = vim.current.line
"    i = 0
"    strWhite = ""
 "   while strLine[i] == ' ' or strLine[i] == "\t":
"        i += 1
 "       strWhite += strLine[i]
 "   vim.current.buffer.append(
"       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
"         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)
"    for strLine in vim.current.buffer:
"        if strLine == "import pdb":
"            break
"        else:
"            vim.current.buffer.append( 'import pdb', 0)
 "           vim.command( 'normal j1')
 v           break
"vim.command( 'map <C-M> :py SetBreakpoint()<cr>')
" 
"def RemoveBreakpoints():
 "   nCurrentLine = int( vim.eval( 'line(".")'))
"    nLines = []
 "   nLine = 1
  "  for strLine in vim.current.buffer:
   "     if strLine == 'import pdb' or strLine.lstrip()[:15] == 'pdb.set_trace()':
   "         nLines.append( nLine)
    "    nLine += 1
   " nLines.reverse()
 "   for nLine in nLines:
 "       vim.command( 'normal %dG' % nLine)
 "       vim.command( 'normal dd')
  "      if nLine < nCurrentLine:
  "          nCurrentLine -= 1
  "  vim.command( 'normal %dG' % nCurrentLine)
""vim.command( 'map <C-U> :py RemoveBreakpoints()<cr>')
"vim.command( 'map <C-D> :!python %<cr>')
"EOF

"""-------------------------------------------vundle config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=D:\Program Files (x86)\Vim\vimfiles\bundle\
set rtp+=~/vimfiles/bundle/ 
call vundle#begin('D:/Program Files (x86)/Vim/vimfiles/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





execute pathogen#infect()

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
