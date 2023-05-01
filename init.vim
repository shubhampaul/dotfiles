" vimbasics {{{1
set nocompatible
filetype plugin indent on
set noshowmode
set ai si
set hlsearch incsearch                   " Search highlighting
set shiftwidth=4 softtabstop=4           " Default tab behaviour
set tabstop=8 expandtab
set textwidth=80                         " Use 80 columns
set scrolloff=5                          " Keep some lines around the cursor
set backspace=2
set history=10000                        " Keep a longer history of things
set scrollback=100000
set wildmenu wildmode=list:longest,full  " Wildmenu behavior
" set wildmenu wildmode=full  " Wildmenu behavior
" set completeopt=menuone,noselect " Use a popup for completion
set noswapfile                           " Don't use swapfiles
set hidden                               " Allow hidden buffers
set gdefault                             " Use g flags for :s by default
set number                               " Show line numbers
set showcmd                              " Show cmd in status bar
set wrap linebreak                       " Wrap lines,: at reasonable points
set foldmethod=marker
set foldopen=hor,insert,jump,mark        " When to open folds
set foldopen+=quickfix,search,tag,undo
set mouse=a                              " Allow using the mouse
set listchars=tab:>-,trail:- list        " Explicity list tabs, trailing spaces
set ignorecase smartcase                 " Search case sensitivity
set cinoptions=l1,h0,N-s,i1s,+2s,c0,C1,u0,U1,ks
set nowrapscan                           " Don't wrap searches
set nojoinspaces                         " Don't insert double spaces
set fo-=t
set tags=tags,TAGS                       " Don't look for tags next to file
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete
syntax on
set relativenumber
set splitright
set splitbelow
set clipboard^=unnamed,unnamedplus
set wrap
"set wrapscan
set tags=tags,TAGS
" helptags $VIMRUNTIME/doc/
" let g:netrw_liststyle = 1
" Leader key
let mapleader = ","
" }}}1

" Key mappings {{{1
cnoremap <C-A> <Home>
" tnoremap <c-s><c-n> <c-\><c-n>:tabn<cr>
" command! Evimrc :e ~/.config/nvim/init.vim
nnoremap <leader>sv :so ~/.config/nvim/init.vim<cr>

nnoremap <leader>i :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>v :Vex!<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>cl :ccl<cr>
" nnoremap <leader>cf :cfirst<cr>
" nnoremap <leader>cl :clast<cr>
nnoremap <leader>dt :diffthis<cr>
nnoremap <leader>do :diffoff<cr>
nnoremap <leader>bd :bd!<cr>
nnoremap <leader>ex :Ex<cr>
nnoremap <leader>ec :FZFFiles %:p:h<cr>

nnoremap <c-]> :tsel <c-r><c-w><cr>
" nnoremap <leader>T :tabnew<cr>:term<cr>a
" nnoremap <c-Left> <c-w>h
" nnoremap <c-Right> <c-w>l
" nnoremap <c-Down> <c-w>j
" nnoremap <c-Up> <c-w>k

"navigating windows
tnoremap <A-\> <C-\><C-N>
tnoremap <A-Left> <C-\><C-N><C-w>h
tnoremap <A-Down> <C-\><C-N><C-w>j
tnoremap <A-Up> <C-\><C-N><C-w>k
tnoremap <A-Right> <C-\><C-N><C-w>l
inoremap <A-Left> <C-\><C-N><C-w>h
inoremap <A-Down> <C-\><C-N><C-w>j
inoremap <A-Up> <C-\><C-N><C-w>k
inoremap <A-Right> <C-\><C-N><C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l

nnoremap <leader>t :tabnew<cr>

nnoremap <space>t :terminal<cr>a
nnoremap <space>v :vs term://bash<cr>a
nnoremap <space>s :sp term://bash<cr>a
if executable("htop")
    nnoremap <space>h <cmd>split term://htop<cr>a
endif

nnoremap <space>b :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>acd $VIM_DIR<CR>
nnoremap <A-k> :tabnext<cr>
nnoremap <A-j> :tabprevious<cr>
nnoremap <leader>q :q<cr>
nnoremap <A-i> <c-i>
nnoremap <A-o> <c-o>
nnoremap <Tab> : cnext<cr>
nnoremap <S-Tab> : cprev<cr>

"window resize
" nnoremap <M-Up> 5<c-w>+
" nnoremap <M-Down> 5<c-w>
" nnoremap <M-Left> 5<c-w><
" nnoremap <M-Right> 5<c-w>>

"scrolling
nnoremap <S-Up> {
nnoremap <S-Down> }
" nnoremap ^[[1;3C :2<C-w><<cr>
" }}}1

" plug {{{1

call plug#begin("~/.config/nvim/plugged")

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip' 
Plug 'skywind3000/asyncrun.vim'
" Plug 'neomake/neomake'
" Plug 'tpope/vim-commentary'
Plug 'numToStr/Comment.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'ray-x/lsp_signature.nvim'
if executable("fzf")
    Plug 'junegunn/fzf.vim'
endif
" Plug 'theHamsta/nvim-semantic-tokens'
Plug 'kevinhwang91/nvim-bqf'
Plug 'SmiteshP/nvim-navic'
Plug 'berdandy/ansiesc.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
call plug#end()

" }}}1

" gruvbox and highlight {{{1
" Important!!
 if has('termguicolors')
     set termguicolors
 endif

" For dark version.
set background=dark

" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
colorscheme gruvbox-material
" let g:gruvbox_italic_keywords = 0
" let g:gruvbox_flat_style = 'dark'
" colorscheme gruvbox-flat

"hi! link debugPC Visual
set cursorline
hi debugPC ctermbg=237 guibg=#3c4040
hi RedrawDebugRecompose ctermbg=9 guibg=#870000
" }}}1

" lightline {{{1
let g:lightline = {
      \ 'colorscheme' : 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \ },
      \ 'component': {
      \   'relativepath': '%f:%n'
      \ }
      \ }
" }}}1

" fzf {{{1
if executable("fzf")
    let &rtp .= ",<path-to-fzf-binary>"

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang FZFRG call RipgrepFzf(<q-args>, <bang>0)

    let g:fzf_command_prefix = 'FZF'
    nnoremap <leader>ot :FZFTags<cr>
    nnoremap <leader>og :FZFRG<cr>
    nnoremap <leader>ob :FZFBuffers<cr>
    nnoremap <leader>of :FZFFiles<cr>
    nnoremap <leader>oh :FZFHelptags<cr>
    nnoremap <leader>om :FZFMaps<cr>
    "nnoremap <leader>os :FZFSnippets<cr>
    nnoremap <leader>oc :FZFHistory<cr>
    nnoremap <leader>o: :FZFHistory:<cr>
    nnoremap <leader>o/ :FZFHistory/<cr>

    let g:fzf_action = {
                \ 'ctrl-j': 'split',
                \ 'ctrl-k': 'vsplit',
                \ 'ctrl-l': 'tab split',
                \ }

    " let g:fzf_colors = {
    "             \ 'fg':      ['fg', 'Normal'],
    "             \ 'bg':      ['bg', 'Normal'],
    "             \ 'hl':      ['fg', 'Comment'],
    "             \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    "             \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    "             \ 'hl+':     ['fg', 'Statement'],
    "             \ 'info':    ['fg', 'PreProc'],
    "             \ 'border':  ['fg', 'Ignore'],
    "             \ 'prompt':  ['fg', 'Conditional'],
    "             \ 'pointer': ['fg', 'Exception'],
    "             \ 'marker':  ['fg', 'Keyword'],
    "             \ 'spinner': ['fg', 'Label'],
    "             \ 'header':  ['fg', 'Comment']
    "             \ }
let $BAT_THEME='gruvbox-dark'
endif
" }}}1

" comment {{{1
lua << EOF
require('Comment').setup()
EOF
" }}}1

" indent-line {{{1
lua << EOF
vim.opt.list = true
-- vim.opt.listchars:append "eol:?"

require("indent_blankline").setup {
    show_end_of_line = true,
}
EOF
" }}}1

" nvim-dap {{{1
lua<<EOF

local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '<path-to-OpenDebugAD7-binary>',
}

dap.configurations.cpp = {
  {
    name = "Executable",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', '' .. '', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
        {
                text = '-enable-pretty-printing',
                description =  'enable pretty printing',
                ignoreFailures = false,
        },
    },
  },
}
dap.configurations.c = dap.configurations.cpp

local function dapAttachToProcess()
    local process_id = nil
    local process_name = nil
    local callback = function(input)
        if input then
            process_id = input
        end
    end
    vim.ui.input({ prompt = 'Enter PID:', }, callback)
    process_name = "/proc/" .. process_id .. "/exe"
    dap.run({
        name = "Attach to process",
        type = "cppdbg",
        request = "attach",
        program = process_name,
        processId = process_id,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
            {
                    text = '-enable-pretty-printing',
                    description =  'enable pretty printing',
                    ignoreFailures = false,
            },
        },
    })
end

local dapui = require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  vim.api.nvim_command('tabe %')
  dapui.open()
  vim.api.nvim_echo({{'DAP: ', 'None'}, {'event_initialized', 'None'}}, true, {})
end
dap.listeners.after.disconnect["dapui_config"] = function()
  -- dapui.close()
  vim.api.nvim_echo({{'DAP: ', 'None'}, {'disconnect_reponse', 'None'}}, true, {})
end
dap.listeners.after.event_terminated["dapui_config"] = function()
  -- dapui.close()
  vim.api.nvim_echo({{'DAP: ', 'None'}, {'event_terminated', 'None'}}, true, {})
end

-- DAP Mappings
vim.keymap.set('n', '<A-b>', function() require"dap".toggle_breakpoint() end)
-- vim.keymap.set('n', '<leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<A-f>', function() require"dap".step_out() end)
vim.keymap.set('n', '<A-s>', function() require"dap".step_into() end)
vim.keymap.set('n', '<A-n>', function() require"dap".step_over() end)
vim.keymap.set('n', '<A-c>', function() require"dap".continue() end)
vim.keymap.set('n', '<leader>de', function() require"dap".disconnect() end)
-- vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>kk', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>cb', function() require"dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>eb', function() require"dap".set_exception_breakpoints({"all"}) end)
vim.keymap.set('n', '<A-h>', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>sp', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end)
vim.keymap.set('n', '<A-u>', function() require"dap".up() end)
vim.keymap.set('n', '<A-d>', function() require"dap".down() end)
vim.keymap.set('n', '<A-a>', function() dapAttachToProcess() end)
vim.keymap.set('v', '<A-e>', function() require("dapui").eval() end)



vim.keymap.set('n', '<leader>gg', ':lua require("dapui").toggle()<CR>')
--vim.keymap.set('n', '<leader>tog', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
EOF
" }}}1

" Termbdebug {{{1
let termdebugger = "/usr/local/bin/gdb"
packadd termdebug	

" nnoremap <RightMouse> :Evaluate<CR>
" nnoremap <RightMouse> :Break<CR>
" }}}1

" treesitter {{{1

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
    },

  ensure_installed = {
      "c",
      "cpp"
      },
  }
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
--    indent = {
--    enable = true
--  },
  }
EOF

hi! link TSConstant Purple
hi! link TSNamespace Orange
hi! link TSProperty blue
" }}}1

" nvim-cmp {{{1

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
EOF
" }}}1

" nvim LSP {{{1

" filetype detect
autocmd BufRead,BufNewFile .clangd set filetype=yaml
lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  -- vim.keymap.set('v', '<space>vf', vim.lsp.formatexpr, bufopts)

  -- nvim-navic
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)

end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- function dump(o)
--    if type(o) == 'table' then
--       local s = '{ '
--       for k,v in pairs(o) do
--          if type(k) ~= 'number' then k = '"'..k..'"' end
--          s = s .. '['..k..'] = ' .. dump(v) .. ','
--       end
--       return s .. '} '
--    else
--       return tostring(o)
--    end
-- end

  -- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- print (dump(capabilities))
--capabilities["textDocument"]["semanticHighlightingCapabilities"] = {
--               semanticHighlighting = true
--            }
--local nvim_lsp_clangd_highlight = require'clangd_nvim'

require('lspconfig')['clangd'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "clangd",
            "--background-index",
            "--completion-style=detailed",
            "--clang-tidy",
            "--header-insertion=iwyu",
            -- "--header-insertion-decorators",
            -- "--suggest-missing-includes",
    },
}

require('lspconfig')['pylsp'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "pylsp",
            "-v",
    },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    -- ignore = {'W391'},
                    ignore = {'E203'},
                    maxLineLength = 100,
                },
                black = {
                    enabled = true,
                    line_length = 100,
                },
            },
        },
    },
}

-- require('lspconfig')['pyright'].setup{
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "single"
    }
  })

local diagnostics_active = true
vim.keymap.set('n', '<leader>l', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end)
EOF
" }}}1

" winbar-navic context {{{1
lua << EOF
    local navic = require("nvim-navic")
    navic.setup {
    icons = {
        File          = "Fi:",
        Module        = "Mo:",
        Namespace     = "Ns:",
        Package       = "Pa:",
        Class         = "Cl:",
        Method        = "Mt:",
        Property      = "Pr:",
        Field         = "Fi:",
        Constructor   = "Ct:",
        Enum          = "En:",
        Interface     = "If:",
        Function      = "Fn:",
        Variable      = "Va:",
        Constant      = "Co:",
        String        = "St:",
        Number        = "Nu:",
        Boolean       = "Bo:",
        Array         = "Ar:",
        Object        = "Ob:",
        Key           = "Ke:",
        Null          = "Nu:",
        EnumMember    = "Em:",
        Struct        = "St:",
        Event         = "Ev:",
        Operator      = "Op:",
        TypeParameter = "Ty:",
    },
    highlight = true,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
	safe_output = true
    }
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
EOF
" }}}1

" Perforce {{{1

nnoremap <leader>pe :!p4 edit %<cr>
nnoremap <leader>pr :!p4 revert %<cr>
nnoremap <leader>po :execute "!cd " getcwd() " && p4 opened"<cr>
nnoremap <leader>ps :execute "!cd " getcwd() " && p4 status"<cr>
command! -nargs=? P4diff call P4diff(<args>)
function! P4diff(...)
    " Retrieve file from depot
    let l:tmp = system('mktemp --suffix=".' . expand('%:t') . '"')
    let l:cwd = getcwd()
    cd %:p:h
    if a:0 > 0
        echom 'Diffing against rev ' . a:1
        call system('p4 print -q ' . expand("%:p") . '@=' . a:1 . ' > ' . l:tmp)
    else
        call system('p4 print -q ' . expand("%:p") . ' > ' . l:tmp)
    endif
    exec 'cd ' . l:cwd

    " Diff it
    let l:file = expand("%")
    exec 'tabnew ' . l:tmp
    exec 'vert diffs ' . l:file
endfunction
nnoremap <leader>pd :P4diff<cr>

" }}}1

" Async Commands {{{1

" SCons {{{2
let g:asyncrun_open = 10
" let g:neomake_open_list = 2
" silent! nunmap <leader>mg
function! SconsMake(args, local)
    let l:bufdir = expand("%:p:h")
    let l:curdir = getcwd()
    let l:dir = a:local ? l:bufdir : l:curdir
    " if exists("g:scons_compiler")
    "     let l:args = a:args . " compilers=" . g:scons_compiler
    " endif
    let &makeprg = "cd " . l:dir . " && scons -j20 -u " . a:args
    echom "=== Building in " . l:dir . " ==="
    " execute "copen"
    execute "AsyncRun -program=make"
    " execute "Neomake!"
endfunction

nnoremap <leader>mm :call SconsMake("", 0)<cr>
nnoremap <leader>as :AsyncStop<cr>


" }}}2

" riggrep {{{2
function! GrepAsync(args)
    " let l:bufdir = expand("%:p:h")
    " let l:curdir = getcwd()
    " let l:dir = a:local ? l:bufdir : l:curdir
    " let l:dir = l:curdir
    " let l:wordUnderCursor = expand("<cword>")
    " if exists("g:scons_compiler")
    "     let l:args = a:args . " compilers=" . g:scons_compiler
    " endif
    let &grepprg = "grep " . a:args
    " let &grepprg = "grep -r " . l:wordUnderCursor . " " . l:curdir
    echom "=== Grepping ==="
    " execute "copen"
    execute "AsyncRun -program=grep"
    " execute "Neomake!"
endfunction

command! -nargs=+ ARg call GrepAsync(<q-args>)
nnoremap <leader>G :Rg -w <c-r><c-w><cr>
" nnoremap <leader>G :call GrepAsync()<cr>

" vimbasics {{{1
set nocompatible
filetype plugin indent on
set noshowmode
set ai si
set hlsearch incsearch                   " Search highlighting
set shiftwidth=4 softtabstop=4           " Default tab behaviour
set tabstop=8 expandtab
set textwidth=80                         " Use 80 columns
set scrolloff=5                          " Keep some lines around the cursor
set backspace=2
set history=10000                        " Keep a longer history of things
set scrollback=100000
set wildmenu wildmode=list:longest,full  " Wildmenu behavior
" set wildmenu wildmode=full  " Wildmenu behavior
" set completeopt=menuone,noselect " Use a popup for completion
set noswapfile                           " Don't use swapfiles
set hidden                               " Allow hidden buffers
set gdefault                             " Use g flags for :s by default
set number                               " Show line numbers
set showcmd                              " Show cmd in status bar
set wrap linebreak                       " Wrap lines,: at reasonable points
set foldmethod=marker
set foldopen=hor,insert,jump,mark        " When to open folds
set foldopen+=quickfix,search,tag,undo
set mouse=a                              " Allow using the mouse
set listchars=tab:>-,trail:- list        " Explicity list tabs, trailing spaces
set ignorecase smartcase                 " Search case sensitivity
set cinoptions=l1,h0,N-s,i1s,+2s,c0,C1,u0,U1,ks
set nowrapscan                           " Don't wrap searches
set nojoinspaces                         " Don't insert double spaces
set fo-=t
set tags=tags,TAGS                       " Don't look for tags next to file
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete
syntax on
set relativenumber
set splitright
set splitbelow
set clipboard^=unnamed,unnamedplus
set wrap
"set wrapscan
set tags=tags,TAGS
" helptags $VIMRUNTIME/doc/
" let g:netrw_liststyle = 1
" Leader key
let mapleader = ","
" }}}1

" Key mappings {{{1
cnoremap <C-A> <Home>
" tnoremap <c-s><c-n> <c-\><c-n>:tabn<cr>
" command! Evimrc :e ~/.config/nvim/init.vim
nnoremap <leader>sv :so ~/.config/nvim/init.vim<cr>

nnoremap <leader>i :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>v :Vex!<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>cl :ccl<cr>
" nnoremap <leader>cf :cfirst<cr>
" nnoremap <leader>cl :clast<cr>
nnoremap <leader>dt :diffthis<cr>
nnoremap <leader>do :diffoff<cr>
nnoremap <leader>bd :bd!<cr>
nnoremap <leader>ex :Ex<cr>
nnoremap <leader>ec :FZFFiles %:p:h<cr>

nnoremap <c-]> :tsel <c-r><c-w><cr>
" nnoremap <leader>T :tabnew<cr>:term<cr>a
" nnoremap <c-Left> <c-w>h
" nnoremap <c-Right> <c-w>l
" nnoremap <c-Down> <c-w>j
" nnoremap <c-Up> <c-w>k

"navigating windows
tnoremap <A-\> <C-\><C-N>
tnoremap <A-Left> <C-\><C-N><C-w>h
tnoremap <A-Down> <C-\><C-N><C-w>j
tnoremap <A-Up> <C-\><C-N><C-w>k
tnoremap <A-Right> <C-\><C-N><C-w>l
inoremap <A-Left> <C-\><C-N><C-w>h
inoremap <A-Down> <C-\><C-N><C-w>j
inoremap <A-Up> <C-\><C-N><C-w>k
inoremap <A-Right> <C-\><C-N><C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l

nnoremap <leader>t :tabnew<cr>

nnoremap <space>t :terminal<cr>a
nnoremap <space>v :vs term://bash<cr>a
nnoremap <space>s :sp term://bash<cr>a
if executable("htop")
    nnoremap <space>h <cmd>split term://htop<cr>a
endif

nnoremap <space>b :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>acd $VIM_DIR<CR>
nnoremap <A-k> :tabnext<cr>
nnoremap <A-j> :tabprevious<cr>
nnoremap <leader>q :q<cr>
nnoremap <A-i> <c-i>
nnoremap <A-o> <c-o>
nnoremap <Tab> : cnext<cr>
nnoremap <S-Tab> : cprev<cr>

"window resize
" nnoremap <M-Up> 5<c-w>+
" nnoremap <M-Down> 5<c-w>
" nnoremap <M-Left> 5<c-w><
" nnoremap <M-Right> 5<c-w>>

"scrolling
nnoremap <S-Up> {
nnoremap <S-Down> }
" nnoremap ^[[1;3C :2<C-w><<cr>
" }}}1

" plug {{{1

call plug#begin("~/.config/nvim/plugged")

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip' 
Plug 'skywind3000/asyncrun.vim'
" Plug 'neomake/neomake'
" Plug 'tpope/vim-commentary'
Plug 'numToStr/Comment.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'ray-x/lsp_signature.nvim'
if executable("fzf")
    Plug 'junegunn/fzf.vim'
endif
" Plug 'theHamsta/nvim-semantic-tokens'
Plug 'kevinhwang91/nvim-bqf'
Plug 'SmiteshP/nvim-navic'
Plug 'berdandy/ansiesc.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
call plug#end()

" }}}1

" gruvbox and highlight {{{1
" Important!!
 if has('termguicolors')
     set termguicolors
 endif

" For dark version.
set background=dark

" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
colorscheme gruvbox-material
" let g:gruvbox_italic_keywords = 0
" let g:gruvbox_flat_style = 'dark'
" colorscheme gruvbox-flat

"hi! link debugPC Visual
set cursorline
hi debugPC ctermbg=237 guibg=#3c4040
hi RedrawDebugRecompose ctermbg=9 guibg=#870000
" }}}1

" lightline {{{1
let g:lightline = {
      \ 'colorscheme' : 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \ },
      \ 'component': {
      \   'relativepath': '%f:%n'
      \ }
      \ }
" }}}1

" fzf {{{1
if executable("fzf")
    let &rtp .= ",<path-to-fzf-binary>"

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang FZFRG call RipgrepFzf(<q-args>, <bang>0)

    let g:fzf_command_prefix = 'FZF'
    nnoremap <leader>ot :FZFTags<cr>
    nnoremap <leader>og :FZFRG<cr>
    nnoremap <leader>ob :FZFBuffers<cr>
    nnoremap <leader>of :FZFFiles<cr>
    nnoremap <leader>oh :FZFHelptags<cr>
    nnoremap <leader>om :FZFMaps<cr>
    "nnoremap <leader>os :FZFSnippets<cr>
    nnoremap <leader>oc :FZFHistory<cr>
    nnoremap <leader>o: :FZFHistory:<cr>
    nnoremap <leader>o/ :FZFHistory/<cr>

    let g:fzf_action = {
                \ 'ctrl-j': 'split',
                \ 'ctrl-k': 'vsplit',
                \ 'ctrl-l': 'tab split',
                \ }

    " let g:fzf_colors = {
    "             \ 'fg':      ['fg', 'Normal'],
    "             \ 'bg':      ['bg', 'Normal'],
    "             \ 'hl':      ['fg', 'Comment'],
    "             \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    "             \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    "             \ 'hl+':     ['fg', 'Statement'],
    "             \ 'info':    ['fg', 'PreProc'],
    "             \ 'border':  ['fg', 'Ignore'],
    "             \ 'prompt':  ['fg', 'Conditional'],
    "             \ 'pointer': ['fg', 'Exception'],
    "             \ 'marker':  ['fg', 'Keyword'],
    "             \ 'spinner': ['fg', 'Label'],
    "             \ 'header':  ['fg', 'Comment']
    "             \ }
let $BAT_THEME='gruvbox-dark'
endif
" }}}1

" comment {{{1
lua << EOF
require('Comment').setup()
EOF
" }}}1

" indent-line {{{1
lua << EOF
vim.opt.list = true
-- vim.opt.listchars:append "eol:?"

require("indent_blankline").setup {
    show_end_of_line = true,
}
EOF
" }}}1

" nvim-dap {{{1
lua<<EOF

local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '<path-to-OpenDebugAD7-binary>',
}

dap.configurations.cpp = {
  {
    name = "Executable",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', '' .. '', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
        {
                text = '-enable-pretty-printing',
                description =  'enable pretty printing',
                ignoreFailures = false,
        },
    },
  },
}
dap.configurations.c = dap.configurations.cpp

local function dapAttachToProcess()
    local process_id = nil
    local process_name = nil
    local callback = function(input)
        if input then
            process_id = input
        end
    end
    vim.ui.input({ prompt = 'Enter PID:', }, callback)
    process_name = "/proc/" .. process_id .. "/exe"
    dap.run({
        name = "Attach to process",
        type = "cppdbg",
        request = "attach",
        program = process_name,
        processId = process_id,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
            {
                    text = '-enable-pretty-printing',
                    description =  'enable pretty printing',
                    ignoreFailures = false,
            },
        },
    })
end

local dapui = require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  vim.api.nvim_command('tabe %')
  dapui.open()
  vim.api.nvim_echo({{'DAP: ', 'None'}, {'event_initialized', 'None'}}, true, {})
end
dap.listeners.after.disconnect["dapui_config"] = function()
  -- dapui.close()
  vim.api.nvim_echo({{'DAP: ', 'None'}, {'disconnect_reponse', 'None'}}, true, {})
end
dap.listeners.after.event_terminated["dapui_config"] = function()
  -- dapui.close()
  vim.api.nvim_echo({{'DAP: ', 'None'}, {'event_terminated', 'None'}}, true, {})
end

-- DAP Mappings
vim.keymap.set('n', '<A-b>', function() require"dap".toggle_breakpoint() end)
-- vim.keymap.set('n', '<leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<A-f>', function() require"dap".step_out() end)
vim.keymap.set('n', '<A-s>', function() require"dap".step_into() end)
vim.keymap.set('n', '<A-n>', function() require"dap".step_over() end)
vim.keymap.set('n', '<A-c>', function() require"dap".continue() end)
vim.keymap.set('n', '<leader>de', function() require"dap".disconnect() end)
-- vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>kk', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>cb', function() require"dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>eb', function() require"dap".set_exception_breakpoints({"all"}) end)
vim.keymap.set('n', '<A-h>', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>sp', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end)
vim.keymap.set('n', '<A-u>', function() require"dap".up() end)
vim.keymap.set('n', '<A-d>', function() require"dap".down() end)
vim.keymap.set('n', '<A-a>', function() dapAttachToProcess() end)
vim.keymap.set('v', '<A-e>', function() require("dapui").eval() end)



vim.keymap.set('n', '<leader>gg', ':lua require("dapui").toggle()<CR>')
--vim.keymap.set('n', '<leader>tog', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
EOF
" }}}1

" Termbdebug {{{1
let termdebugger = "/usr/local/bin/gdb"
packadd termdebug	

" nnoremap <RightMouse> :Evaluate<CR>
" nnoremap <RightMouse> :Break<CR>
" }}}1

" treesitter {{{1

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
    },

  ensure_installed = {
      "c",
      "cpp"
      },
  }
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
--    indent = {
--    enable = true
--  },
  }
EOF

hi! link TSConstant Purple
hi! link TSNamespace Orange
hi! link TSProperty blue
" }}}1

" nvim-cmp {{{1

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
EOF
" }}}1

" nvim LSP {{{1

" filetype detect
autocmd BufRead,BufNewFile .clangd set filetype=yaml
lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  -- vim.keymap.set('v', '<space>vf', vim.lsp.formatexpr, bufopts)

  -- nvim-navic
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)

end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- function dump(o)
--    if type(o) == 'table' then
--       local s = '{ '
--       for k,v in pairs(o) do
--          if type(k) ~= 'number' then k = '"'..k..'"' end
--          s = s .. '['..k..'] = ' .. dump(v) .. ','
--       end
--       return s .. '} '
--    else
--       return tostring(o)
--    end
-- end

  -- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- print (dump(capabilities))
--capabilities["textDocument"]["semanticHighlightingCapabilities"] = {
--               semanticHighlighting = true
--            }
--local nvim_lsp_clangd_highlight = require'clangd_nvim'

require('lspconfig')['clangd'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "clangd",
            "--background-index",
            "--completion-style=detailed",
            "--clang-tidy",
            "--header-insertion=iwyu",
            -- "--header-insertion-decorators",
            -- "--suggest-missing-includes",
    },
}

require('lspconfig')['pylsp'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "pylsp",
            "-v",
    },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    -- ignore = {'W391'},
                    ignore = {'E203'},
                    maxLineLength = 100,
                },
                black = {
                    enabled = true,
                    line_length = 100,
                },
            },
        },
    },
}

-- require('lspconfig')['pyright'].setup{
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "single"
    }
  })

local diagnostics_active = true
vim.keymap.set('n', '<leader>l', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end)
EOF
" }}}1

" winbar-navic context {{{1
lua << EOF
    local navic = require("nvim-navic")
    navic.setup {
    icons = {
        File          = "Fi:",
        Module        = "Mo:",
        Namespace     = "Ns:",
        Package       = "Pa:",
        Class         = "Cl:",
        Method        = "Mt:",
        Property      = "Pr:",
        Field         = "Fi:",
        Constructor   = "Ct:",
        Enum          = "En:",
        Interface     = "If:",
        Function      = "Fn:",
        Variable      = "Va:",
        Constant      = "Co:",
        String        = "St:",
        Number        = "Nu:",
        Boolean       = "Bo:",
        Array         = "Ar:",
        Object        = "Ob:",
        Key           = "Ke:",
        Null          = "Nu:",
        EnumMember    = "Em:",
        Struct        = "St:",
        Event         = "Ev:",
        Operator      = "Op:",
        TypeParameter = "Ty:",
    },
    highlight = true,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
	safe_output = true
    }
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
EOF
" }}}1

" Perforce {{{1

nnoremap <leader>pe :!p4 edit %<cr>
nnoremap <leader>pr :!p4 revert %<cr>
nnoremap <leader>po :execute "!cd " getcwd() " && p4 opened"<cr>
nnoremap <leader>ps :execute "!cd " getcwd() " && p4 status"<cr>
command! -nargs=? P4diff call P4diff(<args>)
function! P4diff(...)
    " Retrieve file from depot
    let l:tmp = system('mktemp --suffix=".' . expand('%:t') . '"')
    let l:cwd = getcwd()
    cd %:p:h
    if a:0 > 0
        echom 'Diffing against rev ' . a:1
        call system('p4 print -q ' . expand("%:p") . '@=' . a:1 . ' > ' . l:tmp)
    else
        call system('p4 print -q ' . expand("%:p") . ' > ' . l:tmp)
    endif
    exec 'cd ' . l:cwd

    " Diff it
    let l:file = expand("%")
    exec 'tabnew ' . l:tmp
    exec 'vert diffs ' . l:file
endfunction
nnoremap <leader>pd :P4diff<cr>

" }}}1

" Async Commands {{{1

" SCons {{{2
let g:asyncrun_open = 10
" let g:neomake_open_list = 2
" silent! nunmap <leader>mg
function! SconsMake(args, local)
    let l:bufdir = expand("%:p:h")
    let l:curdir = getcwd()
    let l:dir = a:local ? l:bufdir : l:curdir
    " if exists("g:scons_compiler")
    "     let l:args = a:args . " compilers=" . g:scons_compiler
    " endif
    let &makeprg = "cd " . l:dir . " && scons -j20 -u " . a:args
    echom "=== Building in " . l:dir . " ==="
    " execute "copen"
    execute "AsyncRun -program=make"
    " execute "Neomake!"
endfunction

nnoremap <leader>mm :call SconsMake("", 0)<cr>
nnoremap <leader>as :AsyncStop<cr>


" }}}2

" riggrep {{{2
function! GrepAsync(args)
    " let l:bufdir = expand("%:p:h")
    " let l:curdir = getcwd()
    " let l:dir = a:local ? l:bufdir : l:curdir
    " let l:dir = l:curdir
    " let l:wordUnderCursor = expand("<cword>")
    " if exists("g:scons_compiler")
    "     let l:args = a:args . " compilers=" . g:scons_compiler
    " endif
    let &grepprg = "grep " . a:args
    " let &grepprg = "grep -r " . l:wordUnderCursor . " " . l:curdir
    echom "=== Grepping ==="
    " execute "copen"
    execute "AsyncRun -program=grep"
    " execute "Neomake!"
endfunction

command! -nargs=+ ARg call GrepAsync(<q-args>)
nnoremap <leader>G :Rg -w <c-r><c-w><cr>
" nnoremap <leader>G :call GrepAsync()<cr>

" function! GrepGivenRange() range
" endfunction
" vnoremap <leader>G :call GrepGivenRange()<cr>

" }}}2

" }}}1

" }}}2

" }}}1
