set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here') 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Plugin 'altercation/vim-colors-solarized'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/taglist.vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rdnetto/YCM-Generator'
Plugin 'davidhalter/jedi'
Plugin 'dense-analysis/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/rainbow_parentheses.vim'


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

" ############################## vundle plugin config begin #######################################
" **************************************** solarized ****************************************
" syntax enable
" set background=dark
" colorscheme solarized

" **************************************** YouCompleteMe ****************************************
" 全局配置 
let g:ycm_global_ycm_extra_conf = '~/.vim/ycmConfig/.ycm_extra_conf_global.py'


" 自动补全配置  
set completeopt=longest,menu    				"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 	"离开插入模式后自动关闭预览窗口  
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项  

"上下左右键的行为 会显示其他信息  
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"  
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"  
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"  
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"  
  
"youcompleteme  默认tab  s-tab 和自动补全冲突  
"let g:ycm_key_list_select_completion=['<c-n>']  
let g:ycm_key_list_select_completion = ['<Down>']  
"let g:ycm_key_list_previous_completion=['<c-p>']  
let g:ycm_key_list_previous_completion = ['<Up>']  

let g:ycm_confirm_extra_conf=0				"关闭加载.ycm_extra_conf.py提示  
  
let g:ycm_collect_identifiers_from_tags_files=1 	" 开启 YCM 基于标签引擎  
let g:ycm_min_num_of_chars_for_completion=2 		" 从第2个键入字符就开始罗列匹配项  
let g:ycm_cache_omnifunc=0  				" 禁止缓存匹配项,每次都重新生成匹配项  
let g:ycm_seed_identifiers_with_syntax=1    		" 语法关键字补全  
nnoremap <F6> :YcmDiags<CR>				"diagnose 窗口
nnoremap <F7> :YcmForceCompileAndDiagnostics<CR>    	"force recompile with syntastic  
nnoremap <F8> :YcmDebugInfo<CR>				"show debug message
nnoremap <leader>lo :lopen<CR> 			"open locationlist  
nnoremap <leader>lc :lclose<CR>    			"close locationlist  
inoremap <leader><leader> <C-x><C-o>  
"在注释输入中也能补全  
let g:ycm_complete_in_comments = 1  
"在字符串输入中也能补全  
let g:ycm_complete_in_strings = 1  
"注释和字符串中的文字也会被收入补全  
let g:ycm_collect_identifiers_from_comments_and_strings = 0  
let g:clang_user_options='|| exit 0'  
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处  
nnoremap <leader>gd :YcmCompleter GetDoc<CR> " 跳转到有关的快速信息出
let g:ycm_always_populate_location_list = 1


"let g:ycm_show_diagnostics_ui = 0	" lpc代码编写， 默认关闭代码诊断ui	

" 停止ycmd语法检查 
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_enable_diagnostic_signs = 0

" 手动调用补全, 默认<C-Space>
let g:ycm_key_invoke_completion = '<C-a>'

" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}

"let g:ycm_python_interpreter_path = '/usr/bin/python'
let g:ycm_path_to_python_interpreter='/usr/bin/python3'


"'c' : ['->', '.','re![_a-zA-Z0-9]'],
"'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.','re![_0-9]'],
			\	'cpp,objcpp' : ['->', '.', '::','re![_0-9]'],
            \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
            \             're!\[.*\]\s'],
            \   'ocaml' : ['.', '#'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }


let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '✹'


" **************************************** snippet ****************************************
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.




" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" **************************************** NERDTree ****************************************
map <leader>e :NERDTreeToggle<CR>		" open or close nerdtree

" open nerdtree automatic in some situation 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" **************************************** CtrlP ****************************************
" filter
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" **************************************** taglist ****************************************
map <leader>t :TlistToggle<CR>
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window=1	"taglist窗口在右侧
let Tlist_Close_On_Select=1	"选择完窗口后关闭taglist窗口
let Tlist_GainFocus_On_ToggleOpen=1	"输入焦点在新打开的窗口

" **************************************** auto-pairs ****************************************
"let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", '<':'>'}



" **************************************** ale	****************************************
" comment pylint
let g:ale_linters = {
		\ 'python': ['flake8'],
		\ }

" 默认关闭ale linting 功能（避免编写其他代码如C时，ale覆盖了ycm）， 需要开启可以使用:ALEToggle指令， 详情可以 :h ale 进行查询
let g:ale_enabled = 0

let g:ale_sign_error = '☢️'
let g:ale_sign_warning = '⚠️'

" **************************************** vim airline	****************************************
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体

" **************************************** rainbow parentheses	****************************************
" let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle			" Toggle it on/off
au VimEnter * RainbowParenthesesLoadRound		" (), the default when toggling
au VimEnter * RainbowParenthesesLoadSquare		" []
au VimEnter * RainbowParenthesesLoadBraces		" {}
" au VimEnter * RainbowParenthesesLoadChevrons	" <>   

" ############################# vundle plugin config end #######################################

" ######################################## normal config #############################################
set smarttab
set cscopetag	"ctags ctrl+]列出列表来选择 若想跳转到第一条匹配的只需要set nocscopetag即可。 

" 设置智能缩进，其他可选缩进方式：autoindent, cindent, indentexpr
set smartindent

" 设置显示行号，关闭行号显示命令：set nonumber
set number

" 设置配色方案
colorscheme desert

" 在处理未保存或只读文件的时候，弹出确认
 set confirm
" 设置tab缩进
" set softtabstop=8
" set tabstop=8
" set shiftwidth=8
set softtabstop=4
set tabstop=4
set shiftwidth=4

" 高亮显示关键字
syntax on
syntax enable

" 高亮显示搜索
set hlsearch
set incsearch
" 高亮显示搜索颜色设置
hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow	
" 高亮menu
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
hi YCMInverse term=bold cterm=NONE ctermfg=0 ctermbg=30 gui=NONE

" 显示光标位置
set ruler
" 状态栏行数，2表示显示文件名
set laststatus=2
" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 语言设置
set helplang=en
" 命令行（在状态行下）的高度
set cmdheight=1
" 输入的命令显示出来，看的清楚些
set showcmd

set foldmethod=manual

""""""""""""""""""""""""""""""""""""""""""""""""""
" python setting 
"""""""""""""""""""""""""""""""""""""""""""""""
"let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
"au Filetype python set textwidth=79
"au Filetype python set expandtab
"au Filetype python set autoindent
"au Filetype python set fileformat=unix
"autocmd Filetype python set foldmethod=indent
"autocmd Filetype python set foldlevel=99

"自动插入文件头
autocmd BufNewFile *.cpp,*.cc,*.c,*h,*.sh,*.py exec ":call SetHeader()" 
func! SetHeader() 
	if expand("%:e") == 'sh'
		call setline(1,"\#!/bin/bash") 
		call setline(2, "\#*************************************************************************")
                call setline(3, "\#	> Author	: tmark")
                call setline(4, "\#	> Created Time	: ".strftime("%c"))
                call setline(5, "\#	> File Name	: ".expand("%"))
                call setline(6, "\#	> Description	: ")
                call setline(7, "\#*************************************************************************")
                call setline(8,"")
	elseif expand("%:e") == 'py'
		call setline(1,"#!/usr/bin python")
		call setline(2,"# -*- coding:utf-8 -*-")
                call setline(3, "\"\"\"")
                call setline(4, "\#	> Author	: tmark")
                call setline(5, "\#	> Created Time	: ".strftime("%c"))
                call setline(6, "\#	> File Name	: ".expand("%"))
                call setline(7, "\#	> Description	:")
                call setline(8, "\"\"\"")
                call setline(9,"")
	elseif expand("%:e") == 'cpp' 
                call setline(1, "/*************************************************************************")
                call setline(2, "\ @ Author	: tmark")
                call setline(3, "\ @ Created Time	: ".strftime("%c"))
                call setline(4, "\ @ File Name	: ".expand("%"))
                call setline(5, "\ @ Description	: ")
                call setline(6, " ************************************************************************/")
		call setline(7,"#include <iostream>") 
		call setline(8,"#include <vector>") 
		call setline(9,"#include <string>") 
		call setline(10,"#include <algorithm>") 
		call setline(11, "#include <climits>")
		call setline(12, "#include <deque>") 
		call setline(13, "#include <unordered_map>") 
		call setline(14, "#include <unordered_set>") 
		call setline(15, "") 
		call setline(16, "using namespace std;") 
		call setline(17, "")
		call setline(18, "int main(int argc, char *argv[]) {") 
		call setline(19, "")
		call setline(20, "	return 0;")
		call setline(21, "}")
	elseif expand("%:e") == 'cc' 
		call setline(1,"#include <iostream>") 
		call setline(2, "")
		call setline(3, "using std::cin;") 
		call setline(4, "using std::cout;") 
		call setline(5, "using std::endl;") 
		call setline(6, "")
	elseif expand("%:e") == 'c'
                call setline(1, "/*************************************************************************")
                call setline(2, "\ @ Author	: tmark")
                call setline(3, "\ @ Created Time	: ".strftime("%c"))
                call setline(4, "\ @ File Name	: ".expand("%"))
                call setline(5, "\ @ Description	: ")
                call setline(6, " ************************************************************************/")
		call setline(7,"#include <stdio.h>") 
		call setline(8,"#include <stdlib.h>")
		call setline(9,"#include <string.h>")
		call setline(10,"#include <unistd.h>")
		call setline(11,"")
		call setline(12, "int main(int argc, char *argv[]) {") 
		call setline(13, "")
		call setline(14, "	return 0;")
		call setline(15, "}")
	elseif expand("%:e") == 'h'
		call setline(1, "#ifndef ".toupper(expand("%:r"))."_H")
		call setline(2, "#define ".toupper(expand("%:r"))."_H")
		call setline(3,"")
		call setline(4, "#endif")
	endif
	endfunc 
	autocmd BufNewFile * normal G



""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    "exec "!clear"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    "elseif &filetype == 'java'
    "    exec "!javac %"
    "    exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python %"
    "elseif &filetype == 'html'
    "    exec "!firefox % &"
    "elseif &filetype == 'go'
    "    exec "!go build %<"
    "    exec "!time go run %"
    "elseif &filetype == 'mkd'
    "    exec "!~/.vim/markdown.pl % > %.html &"
    "    exec "!firefox %.html &"
    endif
endfunc


"""""""""""""""""""""""""
" something else
""""""""""""""""""""""""




