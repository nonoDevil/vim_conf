syntax on           	 " 语法高亮
set nocp 		 " 使用不兼容 vi 的模式（vi模式一些操作很不方便）
set autoindent       	 " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set smartindent        	 " 智能对齐方式
set cul			 " 显示当前行下划线
"set tabstop=4 		 " 设置制表符(tab键)的宽度
"set softtabstop=4     	 " 设置软制表符的宽度    
"set shiftwidth=4        " (自动) 缩进使用的4个空格
set cindent              " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     " 设置C/C++语言的具体缩进方式
set backspace=2          " 设置退格键可用
set mouse=a              " 使用鼠标
set number               " 显示行号
filetype plugin indent on 	" 打开文件类型检测
set completeopt=longest,menu	" 关掉智能补全时的预览窗口
set cscopequickfix=s-,c-,d-,i-,t-,e-
set t_Co=256
colorscheme molokai		" 设置配色方案
let g:molokai_original=0
" -- MiniBufferExplorer -- 
let g:miniBufExplMapWindowNavVim = 1 	" 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1 	" Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开
let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口
let g:miniBufExplModSelTarget = 1    	" 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer

" 设置分屏浏览
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" 设置键映射
" 很无奈下面的小括号匹配和 echofunc 插件不兼容....
" 虽然这里注释掉了，但是通过修改 echofunc 插件代码在插件内成功实现...^ ^
" inoremap ( ()<ESC>i
" inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

" 设置按下.之后启动自动补全功能
function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
	return "\<Right>"
else
	return a:char
endif
endf

" 按下F2使用vim自带的补全功能
imap <F2> <C-n>

"-- omnicppcomplete setting --

" 关掉智能补全时的预览窗口
"set completeopt=menu,menuone 		
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_SelectFirstItem = 2
"let OmniCpp_NamespaceSearch = 2
"let OmniCpp_ShowPrototypeInAbbr = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_DisplayMode = 1
"let OmniCpp_ShowScopeInAbbr = 1
"let OmniCpp_ShowAccess = 1

"" 按下F3根据头文件内关键字补全
" imap <F3> <C-X><C-I>

" 设置超级TAB的补全
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-n>"

" 自动补全列表的颜色设置
highlight Pmenu ctermfg=black 
highlight PmenuSel ctermfg=white ctermbg=black

" clang_complete
set completeopt=longest,menu
let g:clang_complete_copen=1
let g:clang_snippets=1
let g:clang_close_preview=1
"let g:clang_periodic_quickfix=1
"let g:clang_use_library=1
"let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'''

"--ctags setting--

" 按下F5重新生成tag文件，并更新taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags
set tags+=/usr/include/tags
set tags+=/usr/include/c++/tags
set tags+=/usr/include/Qt/tags
set tags+=/usr/include/gtk-2.0/tags
set tags+=/usr/include/gtk-3.0/tags

" -- QuickFix setting --

" 按下F6，执行make编译程序，并打开quickfix窗口，显示编译信息
map <F6> :make<CR><CR><CR> :copen<CR><CR>
" 按下F7，光标移到上一个错误所在的行
map <F7> :cp<CR>
" 按下F8，光标移到下一个错误所在的行
map <F8> :cn<CR>
" 按下F9，执行make clean
map <F9> :make clean<CR><CR><CR>

" 以下的映射是使上面的快捷键在插入模式下也能用
imap <F6> <ESC>:make clean<CR><CR><CR>
imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
imap <F8> <ESC>:cp<CR>
imap <F9> <ESC>:cn<CR>
