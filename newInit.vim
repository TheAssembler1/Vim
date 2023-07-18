call plug#begin('~/.config/nvim/plugged')
  Plug 'rust-lang/rust.vim'
  " :CocInstall coc-rust-analyzer
  " :CocInstall coc-prettier
  " :CocInstall coc-eslint
  " :CocInstall coc-json
  " :CocInstall coc-tsserver
  " :CocInstall coc-java
  " :CocInstall coc-clangd
  Plug 'neoclide/coc.nvim', {'branch': 'release'}	
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.1'}
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'vim-airline/vim-airline'
  Plug 'karb94/neoscroll.nvim'
  Plug 'folke/zen-mode.nvim'
  Plug 'ful1e5/onedark.nvim'
  Plug 'preservim/nerdtree'
  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()

" Toggleterm configuration =======================
lua require("toggleterm").setup()
nnoremap <leader>t :ToggleTerm<CR>

" NERDTree configuration =========================
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" vim-alirline configuration =====================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0

" Telescope configuration ========================
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Treesitter configuration =======================
lua << EOF
require("nvim-treesitter.configs").setup({
  ensure_installed = {"c", "lua", "vim", "typescript", "rust", "javascript"},
  sync_install = false,
  auto_install = true,
})
EOF

" ONEDARK configuration =========================
colorscheme onedark

" COC configuration =============================
lua <<EOF
	-- Some servers have issues with backup files, see #649
	vim.opt.backup = false
	vim.opt.writebackup = false
	-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
	-- delays and poor user experience
	vim.opt.updatetime = 300
	-- Always show the signcolumn, otherwise it would shift the text each time
	-- diagnostics appeared/became resolved
	vim.opt.signcolumn = "yes"
	local keyset = vim.keymap.set
	-- Autocomplete
	function _G.check_back_space()
	    local col = vim.fn.col('.') - 1
	    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
	end
	-- Use Tab for trigger completion with characters ahead and navigate
	-- NOTE: There's always a completion item selected by default, you may want to enable
	-- no select by setting `"suggest.noselect": true` in your configuration file
	-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
	-- other plugins before putting this into your config
	local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
	keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
	keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
	-- Make <CR> to accept selected completion item or notify coc.nvim to format
	-- <C-g>u breaks current undo, please make your own choice
	keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
	-- Use <c-j> to trigger snippets
	keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
	-- Use <c-space> to trigger completion
	keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
EOF

" NVIM configuration ============================
let g:rustfmt_autosave = 1
set relativenumber
set ignorecase
set tabstop=2
set shiftwidth=2
set expandtab
set ttyfast
set nowrap
set cursorline
set noswapfile
" enables copy and paste from system clipboard
set clipboard=unnamedplus
set nohlsearch

syntax enable
filetype plugin indent on
