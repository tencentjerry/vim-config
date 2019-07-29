call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'

" 代码补全插件
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',  'for': ['c', 'cpp'] }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" .h .cpp切换
Plug 'vim-scripts/a.vim'

Plug 'crusoexia/vim-monokai'
Plug 'tpope/vim-surround'

" 自动后台更新ctags
 Plug 'ludovicchabant/vim-gutentags'
 Plug 'skywind3000/gutentags_plus'
"
" "搜索栏预览
 Plug 'skywind3000/vim-preview'
" 异步执行插件
Plug 'skywind3000/asyncrun.vim'

" 最强搜索插件
 Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

 Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

" -------------------------------------常规配置----------------------------------
let mapleader=";"
set laststatus=2

syntax enable
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nu

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030
colorscheme monokai

"cpp-enhanced-highlight
""高亮类，成员函数，标准库和模板
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:cpp_concepts_highlight = 1
"文件较大时使用下面的设置高亮模板速度较快，但会有一些小错误
let g:cpp_experimental_template_highlight = 1
"  ------------------------------------End--------------------------------------


let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }



" leaderf 快捷键设置成ctrl + p
let g:Lf_ShortcutF = '<C-P>'
noremap <Leader>ff :LeaderfFunction<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>fl :LeaderfLine<cr>
 
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
 
let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }

set tags=./.tags;,.tags
let $GTAGSLABEL = 'pygments'
let $GTAGSCONF = '/etc/gtags.conf'
"" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.git','.root','.svn','.hg','.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
"
" " 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
 if executable('ctags')
 let g:gutentags_modules += ['ctags']
endif

 if executable('gtags-cscope') && executable('gtags')
 let g:gutentags_modules += ['gtags_cscope']
 endif

" " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags
" 目录中，避免污染工程目录
 let g:gutentags_cache_dir = expand('~/.cache/tags')
"
" " 配置 ctags 的参数
 let g:gutentags_ctags_extra_args = []
 let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
 let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
 let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"
" " 如果使用 universal ctags 需要增加下面一行
 let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
"
" " 禁用 gutentags 自动加载 gtags 数据库的行为
" " 避免多个项目数据库相互干扰,使用plus插件解决问题
 let g:gutentags_auto_add_gtags_cscope = 0
"
" "let g:gutentags_define_advanced_commands = 1
"
" " change focus to quickfix window after search (optional).
 let g:gutentags_plus_switch = 1
"
" " default keymap
" "<leader>csFind symbol (reference) under cursor
" "<leader>cgFind symbol definition under cursor
" "<leader>cdFunctions called by this function
" "<leader>ccFunctions calling this function
" "<leader>ctFind text string under cursor
" "<leader>ceFind egrep pattern under cursor
" "<leader>cfFind file name under cursor
" "<leader>ciFind files #including the file name under cursor
" "<leader>caFind places where current symbol is assigned
"
" "----------vim-preview配置-----------------------------------------
" "P 预览 大p关闭
 autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
 autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
