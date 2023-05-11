-- Lazy (Plugin Manager) {{{1
-- Bootstrap Lazy {{{2
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- }}}2
local plugins = {
    {
        "junegunn/fzf.vim",
        init = function() vim.g.fzf_command_prefix = "FZF" end,
        dependencies = {
            "junegunn/fzf",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua",
        },
    },
    "lukas-reineke/indent-blankline.nvim",
    "sainnhe/gruvbox-material",
    {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
    },
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-treesitter/nvim-treesitter",
    "SmiteshP/nvim-navic",
    "skywind3000/asyncrun.vim",
}

-- Options {{{2
local opts = {
    root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
    defaults = {
        lazy = false,                         -- should plugins be lazy-loaded?
    },
}
-- }}}2

require("lazy").setup(plugins, opts)
-- }}}1

-- Basic Options {{{1
vim.opt.showmode = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true -- Search highlighting
vim.opt.incsearch = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 8
vim.opt.expandtab = true
vim.opt.textwidth = 100 -- Break a line at 100 columns
vim.opt.scrolloff = 5   -- Keep lines around the cursor for context
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.history = 10000 -- Keep a longer history of things
vim.opt.scrollback = 100000
vim.opt.wildmenu = true
vim.opt.wildmode = { "list:longest", "full" }
vim.opt.swapfile = false
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.gdefault = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.foldmethod = "marker"
vim.opt.foldopen = { "hor", "search" }
vim.opt.mouse = "a"
vim.opt.listchars = { tab = ">-", trail = "-" }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cinoptions = { "l1", "h0", "N-s", "i1s", "+2s", "c0", "C1", "u0", "U1", "ks" }
vim.opt.wrapscan = false
vim.opt.joinspaces = false
vim.opt.tags = { "tags", "TAGS" }
-- vim.opt.statuscolumn = "%C %s %l %r"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "SConscript*", "SConstruct*" },
    callback = function() vim.bo.filetype = "python" end,
})
-- set fo-=t
-- }}}1

-- Basic Key-maps {{{1
vim.g.std_config_path = vim.fn.stdpath("config")
vim.g.mapleader = ","                          -- vim.g for 'let'
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>") --keymap by default noremap (non-recursive)
vim.keymap.set("n", "<leader>i", string.format(":e %s/init.lua<cr>", vim.g.std_config_path))
vim.keymap.set("n", "<leader>s", string.format(":s %s/init.lua<cr>", vim.g.std_config_path))
vim.keymap.set("c", "<C-a>", "<home>")
vim.keymap.set("n", "<leader>v", "<cmd>Vex!<cr>")
vim.keymap.set("n", "<leader>co", ":copen<cr>")
vim.keymap.set("n", "<leader>cl", ":cclose<cr>")
vim.keymap.set("n", "<leader>dt", ":windo diffthis<cr>")
vim.keymap.set("n", "<leader>do", ":windo diffoff<cr>")
vim.keymap.set("n", "<leader>bd", ":bdelete!<cr>")
vim.keymap.set("n", "<leader>x", ":Explore<cr>")

-- Navigating Windows
vim.keymap.set("t", [[<A-Left>]], [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", [[<A-Down>]], [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", [[<A-Up>]], [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", [[<A-Right>]], [[<C-\><C-n><C-w>l]])
vim.keymap.set("i", [[<A-Left>]], [[<C-\><C-n><C-w>h]])
vim.keymap.set("i", [[<A-Down>]], [[<C-\><C-n><C-w>j]])
vim.keymap.set("i", [[<A-Up>]], [[<C-\><C-n><C-w>k]])
vim.keymap.set("i", [[<A-Right>]], [[<C-\><C-n><C-w>l]])
vim.keymap.set("n", [[<A-Left>]], [[<C-\><C-n><C-w>h]])
vim.keymap.set("n", [[<A-Down>]], [[<C-\><C-n><C-w>j]])
vim.keymap.set("n", [[<A-Up>]], [[<C-\><C-n><C-w>k]])
vim.keymap.set("n", [[<A-Right>]], [[<C-\><C-n><C-w>l]])

vim.keymap.set("t", [[<A-h>]], [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", [[<A-j>]], [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", [[<A-k>]], [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", [[<A-l>]], [[<C-\><C-n><C-w>l]])
vim.keymap.set("i", [[<A-h>]], [[<C-\><C-n><C-w>h]])
vim.keymap.set("i", [[<A-j>]], [[<C-\><C-n><C-w>j]])
vim.keymap.set("i", [[<A-k>]], [[<C-\><C-n><C-w>k]])
vim.keymap.set("i", [[<A-l>]], [[<C-\><C-n><C-w>l]])
vim.keymap.set("n", [[<A-h>]], [[<C-\><C-n><C-w>h]])
vim.keymap.set("n", [[<A-j>]], [[<C-\><C-n><C-w>j]])
vim.keymap.set("n", [[<A-k>]], [[<C-\><C-n><C-w>k]])
vim.keymap.set("n", [[<A-l>]], [[<C-\><C-n><C-w>l]])

-- Basic Navigation
vim.keymap.set("n", [[<A-k>]], [[:tabnext<cr>]])
vim.keymap.set("n", [[<A-j>]], [[:tabprevious<cr>]])
vim.keymap.set("n", [[<A-i>]], [[<C-i>]])
vim.keymap.set("n", [[<A-o>]], [[<C-o>]])
vim.keymap.set("n", [[<Tab>]], [[:cnext<cr>]])
vim.keymap.set("n", [[<S-Tab>]], [[:cprev<cr>]])
vim.keymap.set("i", [[<C-k>]], [[<Up>]])
vim.keymap.set("i", [[<C-j>]], [[<Down>]])
vim.keymap.set("i", [[<C-h>]], [[<Left>]])
vim.keymap.set("i", [[<C-l>]], [[<Right>]])

-- Terminal
vim.keymap.set("t", [[<A-\>]], [[<C-\><C-n>]])
vim.keymap.set("n", [[<leader>t]], [[:tabnew<cr>]])
vim.keymap.set("n", [[<space>t]], [[:terminal<cr>a]])
vim.keymap.set("n", [[<space>v]], [[:vs term://bash<cr>a]])
vim.keymap.set("n", [[<space>s]], [[:sp term://bash<cr>a]])
vim.keymap.set("n", [[<space>b]], [[:let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>acd $VIM_DIR<CR>]])
if vim.fn.executable("htop") == 1 then
    vim.keymap.set("n", [[<space>h]], [[:tabnew term://htop -u "$(whoami)"<cr>a]])
end

-- Scrolling
vim.keymap.set("n", [[<S-Up>]], [[{]])
vim.keymap.set("n", [[<S-Down>]], [[}]])

-- }}}1

-- Theme {{{1
if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

vim.opt.background = "dark"
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.cmd.colorscheme("gruvbox-material")
vim.opt.cursorline = true

vim.api.nvim_set_hl(0, 'debugPC', { bg = "#3c4040" })
vim.api.nvim_set_hl(0, 'RedrawDebugRecompose', { bg = "#870000" })
-- }}}1

-- LSP-config {{{1
-- Setup language servers.
local lspconfig = require('lspconfig')

-- Set up nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Set up nvim-navic
local navic = require("nvim-navic")

-- clangd {{{2
lspconfig.clangd.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    cmd = { "clangd",
        "--background-index",
        "--completion-style=detailed",
        "--clang-tidy",
        "--header-insertion=iwyu",
        -- "--header-insertion-decorators",
        -- "--suggest-missing-includes",
    },
    capabilities = capabilities,
    on_attach = function(client, bufnr) navic.attach(client, bufnr) end,
}
-- }}}2

-- pylsp {{{2
lspconfig.pylsp.setup {
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
                    ignore = { 'E203' },
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
-- }}}2

-- lua_ls {{{2
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            -- workspace = {
            --   -- Make the server aware of Neovim runtime files
            --   library = vim.api.nvim_get_runtime_file("", true),
            -- },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
-- }}}2

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
-- }}}1

-- Treesitter {{{1
-- Setup {{{2
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
-- }}}2
vim.api.nvim_set_hl(0, 'TSConstant', { link = "Purple" })
vim.api.nvim_set_hl(0, 'TSNamespace', { link = "Orange" })
-- vim.api.nvim_set_hl(0, 'TSProperty', { link = "Blue" })
-- }}}1

-- FZF {{{1
if vim.fn.executable("fzf") == 1 then
    vim.opt.rtp:append("~/fzf")
    vim.keymap.set("n", "<leader>ec", ":FZFFiles %:p:h<cr>")
    vim.keymap.set("n", "<leader>ot", ":FZFTags<cr>")
    vim.keymap.set("n", "<leader>og", ":FZFRG<cr>")
    vim.keymap.set("n", "<leader>ob", ":FZFBuffers<cr>")
    vim.keymap.set("n", "<leader>of", ":FZFFiles<cr>")
    vim.keymap.set("n", "<leader>oh", ":FZFHelptags<cr>")
    vim.keymap.set("n", "<leader>om", ":FZFMaps<cr>")
    -- vim.keymap.set("n", "<leader>os", ":FZFSnippets<cr>")
    vim.keymap.set("n", "<leader>oc", ":FZFHistory<cr>")
    vim.keymap.set("n", "<leader>o:", ":FZFHistory:<cr>")
    vim.keymap.set("n", "<leader>o/", ":FZFHistory/<cr>")
    vim.g.fzf_action = {
        ["ctrl-s"] = "split",
        ["ctrl-v"] = "vsplit",
        ["ctrl-t"] = "tab split",
    }

    vim.cmd([[
    function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
      call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
    endfunction

    command! -nargs=* -bang FZFRG call RipgrepFzf(<q-args>, <bang>0)
    ]])
    vim.env.BAT_THEME = "gruvbox-dark"
end
-- }}}1

-- nvim-cmp (completion) {{{1
local cmp = require 'cmp'
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- ['<Down>'] = function()
        --     cmp.close()
        --     vim.cmd("norm! j")
        -- end,
        -- ['<Up>'] = function()
        --     cmp.close()
        --     vim.cmd("norm! k")
        -- end,
        ['<Down>'] = cmp.config.disable,
        ['<Up>'] = cmp.config.disable,
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'cmdline' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_document_symbol' },
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

-- }}}1

-- DAP {{{1
local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = 'OpenDebugAD7',
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
                description = 'enable pretty printing',
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
                description = 'enable pretty printing',
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
    vim.api.nvim_echo({ { 'DAP: ', 'None' }, { 'event_initialized', 'None' } }, true, {})
end
dap.listeners.after.disconnect["dapui_config"] = function()
    -- dapui.close()
    vim.api.nvim_echo({ { 'DAP: ', 'None' }, { 'disconnect_reponse', 'None' } }, true, {})
end
dap.listeners.after.event_terminated["dapui_config"] = function()
    -- dapui.close()
    vim.api.nvim_echo({ { 'DAP: ', 'None' }, { 'event_terminated', 'None' } }, true, {})
end

-- DAP Mappings
vim.keymap.set('n', '<A-b>', function() require "dap".toggle_breakpoint() end)
-- vim.keymap.set('n', '<leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<A-f>', function() require "dap".step_out() end)
vim.keymap.set('n', '<A-s>', function() require "dap".step_into() end)
vim.keymap.set('n', '<A-n>', function() require "dap".step_over() end)
vim.keymap.set('n', '<A-c>', function() require "dap".continue() end)
vim.keymap.set('n', '<leader>de', function() require "dap".disconnect() end)
-- vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>kk', function() require "dap".terminate() end)
vim.keymap.set('n', '<leader>cb', function() require "dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>eb', function() require "dap".set_exception_breakpoints({ "all" }) end)
vim.keymap.set('n', '<leader>h', function() require "dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>sp',
    function()
        local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
    end)
vim.keymap.set('n', '<A-u>', function() require "dap".up() end)
vim.keymap.set('n', '<A-d>', function() require "dap".down() end)
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
-- }}}1

-- nvim-navic (Code Context) {{{1
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
-- }}}1

-- Perforce {{{1
vim.keymap.set("n", "<leader>pe", ":!p4 edit %<cr>")
vim.keymap.set("n", "<leader>pr", ":!p4 revert %<cr>")
local function P4diff(opts)
    local changelist = opts.fargs[1] or nil
    local file_path = vim.fn.expand("%:p")
    local temp_file = vim.fn.system([[mktemp --suffix=".]] .. vim.fn.expand("%:t") .. [["]])
    if changelist == nil then
        vim.fn.system(string.format([[p4 print -q %s > %s]], vim.fn.expand("%:p"), temp_file))
    else
        vim.fn.system(string.format([[p4 print -q %s@%s > %s]], vim.fn.expand("%:p"), changelist, temp_file))
    end
    vim.fn.execute([[tabnew]] .. temp_file)
    vim.fn.execute([[vertical diffsplit ]] .. file_path)
end

vim.api.nvim_create_user_command("P4diff", P4diff, { nargs = "?" })
vim.keymap.set("n", "<leader>pd", ":P4diff<cr>")
-- }}}1

-- AsyncRun {{{1
vim.keymap.set("n", "<leader>as", ":AsyncStop<cr>")

-- SCons {{{2
vim.g.asyncrun_open = "10"
local function SconsMake(args, local_build)
    local dir
    if local_build then
        dir = vim.fn.expand("%:p:h") -- buffer directory
    else
        dir = vim.fn.getcwd()        -- current working directory
    end
    local make_cmd = "cd " .. dir .. " && scons -j20 " .. args
    vim.opt.makeprg = make_cmd
    print("=== Building in " .. dir .. " ===")
    vim.fn.execute("AsyncRun -program=make")
end

vim.keymap.set("n", "<leader>mm", function() SconsMake("", false) end)
-- }}}2

-- RipGrep {{{2

local function RipGrep(opts)
    local args = opts.fargs[1] or nil
    local grep_cmd = "rg --vimgrep -i -S " .. args
    vim.opt.grepprg = grep_cmd
    vim.fn.execute("AsyncRun -program=grep")
end
vim.api.nvim_create_user_command("Rg", RipGrep, { nargs = 1 })
vim.keymap.set("n", "<leader>G", ":Rg -w <c-r><c-w><cr>")
-- }}}2
-- }}}1
