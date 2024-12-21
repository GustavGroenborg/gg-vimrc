"
" --- GENERAL SETTINGS ---
"

" Please note, that lua files are called from ~/.config/nvim/init.vim

" Importing default settings
source /usr/share/vim/vim90/defaults.vim

" Turning on syntax
syntax on

" Replacing tabs with spaces
:set tabstop=4 shiftwidth=4 expandtab

" Improving navigation
:set ruler
:set showcmd
:set history=50

" Configuring line numbers
set number numberwidth=4

" Configuring highlighting
highlight LineNr ctermfg=grey
set is hls


if has("vms")
    set nobackup        " Do not keep a backup file, use versions instead
else
    set backup          " Keep a backup file, restore from previous version
    if has('persistent_undo')
        set undofile    " Keep an undo file
    endif
endif

" Highlighting the last used search pattern
if &t_Co > 2 || has("gui_running")
    set hlsearch
endif

" Command line tools
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'


"
" --- netrw ---
"
let g:netrw_list_hide = '.*\~'


"
" --- vim-plug ---
"

" Plugins to be downloaded in the directory specified below
call plug#begin('~/.vim/plugged')

" Remember to run the command `:PlugInstall` after having added a new plugin.
Plug 'sainnhe/everforest'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rbgrouleff/bclose.vim' " ghcup dependency
Plug 'hasufell/ghcup.vim' " Haskell plugin
Plug 'mrcjkb/haskell-tools.nvim' " Haskell tools
Plug 'preservim/nerdtree'
call plug#end()

" To delete a plugin, remove the line plugging the plugin, then restart vim
" and run the command, ⁄ `:PlugClean`.

"
" --- GHCUP ---
"
" open ghcup in the current buffer
nnoremap <Leader>g :GHCup<CR>

"

"
" --- DEOPLETE ---
"
let g:deoplete#enable_at_startup = 1


"
" --- EVERFOREST ---
"

" Adding the Everforest color-pack

" For dark version
set background=dark

" Setting the contrast
let g:everforest_background='soft'

" For better performance
let g:everforest_better_performance=1

" Enabling italics
let g:everforest_enable_italics=1

" Setting the color scheme
colorscheme everforest

" Highlighting bad spelling, even on dark themes
augroup spell_colours
    autocmd!
    autocmd ColorScheme everforest hi SpellBad cterm=reverse
augroup END

"
" --- QUALITY OF LIFE IMPROVEMENTS ---
"

" Indent on next line will match the indent of the current line
filetype indent on

" Setting quit, save, and quit-and-save to also start with upper-case characters
:command WQ wq
:command Wq wq
:command W w
:command Q q
" Personal command for changing the colorsceme
:command SUS highlight Normal cftermfg=black ctermbg=yellow | highlight EndOfBuffer ctermfg=black ctermbg=yellow



"
" --- SYNTASTIC ---
"
"
" Enabling messages with the spell highlighting
"let g:syntastic_quiet_messages = { "type": "style" }
"
" Making Syntastic accept C++20, keywords: cpp
"let g:syntastic_cpp_compiler_options = ' --std=c++20'


"
" -- ALE ---
"
let g:ale_fixers = {
\   'cpp' : [
\       'astyle'
\   ],
\}
set completeopt=menu,menuone,popup,noselect,noinsert

let g:ale_python_auto_virtualenv = 1


"
" --- STYLE SETTINGS ---
"

augroup style_settings
    " Almost sorted by file type

    "
  " start -- *.md MARKDOWN -- start

  "Keywords: filetype, declaration
  " Defining the MarkDown filetype. Keywords: md, markdown
  autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

  "Keywords: legnth, maxwidth
  " setting column max to 80.
  autocmd FileType markdown setlocal textwidth=80

  "Keywords: spelling, english
  " Setting spelling to british english.
  autocmd FileType markdown setlocal spell spelllang=en_gb

  "   end -- *.md MARKDOWN -- end
  "



  "
  " start -- *.tex LaTeX -- start

  "Keywords: length, maxwidth
  " Setting the maximum textwidth.
  autocmd FileType tex setlocal textwidth=80

  " Setting the spelling language to English, if it is a tex file.
  autocmd FileType tex setlocal spell spelllang=en_gb

  "   end -- *.tex LaTeX -- end
  "



  "
  " start -- *.txt TEXT -- start

  "Keywords: length, maxwidth
  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  "
  "   end -- *.txt TEXT -- end



  "
  " start -- *.cpp C++ -- start

  "Keywords: length, maxwidth
  " Setting the maximum textwidth.
  autocmd FileType cpp setlocal textwidth=80

  "Keywords: cppspell spelling spelllang
  " Setting the spelling to british english
  autocmd FileType cpp setlocal spell spelllang=en_gb

  "   end -- *.cpp C++ -- end
  "


  "
  " start -- *.cs C# -- start

  "Keywords: length, maxwidth
  " Setting the maximum textwidth.
  autocmd FileType cs setlocal textwidth=80

  "Keywords: csspeell spelling spelllang c#spell
  " Setting the spelling to british english.
  autocmd FileType cs setlocal spell spelllang=en_gb

  "   end -- *.cs C# -- end
  "



  "
  " start -- *.java Java -- start

  " Keywords: length, maxwidth
  "  Setting the maximum textwidth
  autocmd FileType Java setlocal textwidth=80

  " Keywords: javaspell
  "  Setting the spelling to british english.
  autocmd FileType Java setlocal spell spelllang=en_gb

  "  end -- *.java Java -- end
  "


  "
  " start -- *.rs Rust -- start

  " Keywords: length, maxwidth
  "     Setting the maximum textwidth
  autocmd FileType rust setlocal textwidth=80

  " Keywords: rustspell
  "     Setting the spelling
  autocmd FileType rust setlocal spell spelllang=en_gb

  "   end -- *.rs Rust -- end
  "


  "
  " start -- *.jflex JFlex -- start

  au BufRead,BufNewFile *.flex,*.jflex set filetype=jflex
  autocmd FileType jflex setlocal textwidth=80
  autocmd FileType jflex setlocal spell spelllang=en_gb

  "   end -- *.jflex JFlex -- end
  "

  "
  " start -- *.cup JavaCUP -- start
  au BufRead,BufNewFile *.cup set filetype=cup
  autocmd FileType cup setlocal textwidth=80
  autocmd FileType cup setlocal spell spelllang=en_gb
  "   end -- *.cup JavaCUP -- end
  "
 
  "
  " start -- *.zsh-theme Oh-my-zsh theme -- start
  au BufRead,BufNewFile *.zsh-theme set syntax=zsh


  "   end -- *.zsh-theme Oh-my-zsh theme -- end
  "
  "
augroup END

"
" start -- VimTeX -- start
"
filetype plugin on

" Enabling ViM's syntax features
syntax enable

" Preventing viewer from automatically opening after compile
let g:vimtex_view_automatic=0

" Putting the output files in a directory named, "build"
let g:vimtex_compiler_latexmk = {
    \ 'out_dir' : 'build/',
    \}

augroup VimTeX
    autocmd!
    " Setting path of master.tex
    autocmd BufReadPre * if !empty($MASTER_TEX) | let b:vimtex_main = $MASTER_TEX | endif
augroup END

" For help on compiler options see `:help vimtex-options`

"
"   end -- VimTeX -- end
"

"
" start -- C++ -- start
"
" Setting the build directory based on available environment variable.
let g:ale_c_build_dir = $BUILD_DIR
"
"   end -- C++ -- end
"
