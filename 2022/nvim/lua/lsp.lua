-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function(server)
--   local opts = {}
--   server:setup {
--     capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
--   }
--   vim.cmd [[ do User LspAttachBuffers ]]
-- end)
--[[
-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })] ])

]]--
require("nvim-lsp-installer").setup {}


-- local autocmd = vim.api.nvim_create_autocmd
-- local yank_group = augroup('HighlightYank', {})
-- autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
--     pattern = "*.rs",
--     callback = function()
--         require("lsp_extensions").inlay_hints{}
--     end
-- })

local v = require("keymap");
local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function()
			-- v.nnoremap("gd", function() vim.lsp.buf.definition() end)
			-- v.nnoremap("K", function() vim.lsp.buf.hover() end)
			-- v.nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			-- v.nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			-- v.nnoremap("[d", function() vim.diagnostic.goto_next() end)
			-- v.nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			-- v.nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			-- v.nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
			-- 		                filter = function(code_action)
			-- 		                    if not code_action or not code_action.data then
			-- 		                        return false
			-- 		                    end
			--
			-- 		                    local data = code_action.data.id
			-- 		                    return string.sub(data, #data - 1, #data) == ":0"
			-- 		                end,
			-- 		                apply = true
			-- 		            }) end)
			-- v.nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			-- v.nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			-- v.inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

require("lspconfig").clangd.setup(config())
require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

-- who even uses this?
require("lspconfig").rust_analyzer.setup(config({
	-- cmd = { "rustup", "run", "nightly", "rust-analyzer" },
	--[[
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
    --]]
}))

require("lspconfig").sumneko_lua.setup(config({
}))

local opts_symbols = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}
require("symbols-outline").setup(opts_symbols)

local rust_tools_opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        -- hover_with_actions = true,
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = ">> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            -- highlight = "Comment",
            highlight = "htmlTag",
        },
    },

    -- all the rust_tools_opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(rust_tools_opts)
