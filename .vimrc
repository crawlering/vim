:set nu
:set hlsearch
:set autoindent
:set incsearch 
"自动搜索不需要输入完整字符就开始匹配
":set invlist "显示不可见字符
:set nolist "关闭显示不可见字符 默认选项
:set tabstop=4  "tab 键设置为四个空格


"进入文件光标回到前一次所在的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

