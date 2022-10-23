-- Hide ~ from end of lines.
vim.opt.fillchars = { eob = " " }

-- Add icons for lsp diagnostics sings
vim.cmd
[[
sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=
]]


-- require("tokyonight").setup({
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--   light_style = "day", -- The theme is used when the background is set to light
--   transparent = false, -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--   styles = {
--     -- Style to be applied to different syntax groups
--     -- Value is any valid attr-list value for `:help nvim_set_hl`
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {},
--     variables = {},
--     -- Background styles. Can be "dark", "transparent" or "normal"
--     sidebars = "dark", -- style for sidebars, see below
--     floats = "dark", -- style for floating windows
--   },
--   sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--   day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--   dim_inactive = false, -- dims inactive windows
--   lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--
--   --- You can override specific color groups to use other groups or a hex color
--   --- function will be called with a ColorScheme table
--   ---@param colors ColorScheme
--   on_colors = function(colors) end,
--
--   --- You can override specific highlights to use other groups or a hex color
--   --- function will be called with a Highlights and ColorScheme table
--   ---@param highlights Highlights
--   ---@param colors ColorScheme
--   on_highlights = function(highlights, colors) end,
-- })

-- vim.g.tokyonight_style = "day" -- styles: storm, night and day.
-- vim.g.onedark_style = "deep"     -- styles: dark, darker, cool, deep, warm and warmer.
-- vim.g.enfocado_style = "nature"    -- styles: nature and neon.
-- vim.g.codedark_transparent = true

-- vim.g.vscode_transparent = 1
-- vim.g.vscode_style = "dark"
-- vim.cmd("colorscheme vscode")
-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'
vim.cmd("colorscheme vscode")

local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg =true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
        -- vscPink = '#569CD6',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        -- Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
        -- Identifier = { fg = c.vscLightBlue, bg = 'NONE' },
        -- Function = { fg = c.vscYellow, bg = 'NONE' },
        CursorLine = { bg = 'NONE'},
        Statement = { fg = c.vscBlue, bg = 'NONE' },
        Conditional = { fg = c.vscBlue, bg = 'NONE' },
        -- Repeat = { fg = c.vscBlue, bg = 'NONE' },
        -- Label = { fg = c.vscBlue, bg = 'NONE' },
        -- Operator = { fg = c.vscFront, bg = 'NONE' },
        Keyword = { fg = c.vscBlue, bg = 'NONE' },
        -- Exception = { fg = c.vscBlue, bg = 'NONE' },
        -- PreProc = { fg = c.vscBlue, bg = 'NONE' },
        Include = { fg = c.vscBlue, bg = 'NONE' },
        Define = { fg = c.vscBlue, bg = 'NONE' },
        -- keyword = { fg = c.vscBlue, bg = 'NONE' },
        -- Comment = { fg = c.vscBlue, bg = 'NONE'},
        LineNr = { fg = c.vscLineNumber, bg = 'NONE' },
        Whitespace = { fg = "#404040", bg = 'NONE' },
        IndentBlanklineContextChar = { fg = "#FF4040", bg = 'NONE' },
        IndentBlanklineContextSpaceChar = { fg = "#404040", bg = 'NONE' },
        IndentBlanklineChar = { fg = "#404040", bg = 'NONE' },
    }
})

require('lualine').setup({
    options = {
        theme = 'vscode',
    },
})
-- vim.cmd("colorscheme PaperColor")
-- vim.g.airlinetheme = "vscode"
-- vim.cmd("colorscheme tokyonight")


function _G.make_codeart_transparent()
  vim.cmd("highlight Normal guibg=NONE guifg=NONE")
  vim.cmd("highlight NormalNc guibg=NONE guifg=NONE")
  vim.cmd("highlight LineNr guibg=NONE guifg=NONE")
  vim.cmd("highlight CursorLineNr guibg=NONE guifg=NONE")
  vim.cmd("highlight SignColumn guibg=NONE guifg=NONE")
  vim.cmd("highlight EndOfBuffer guibg=NONE guifg=NONE")


  vim.cmd("highlight NvimTreeNormal guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeNormalNc guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeEndOfBuffer guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeFolderIcon guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeOpenedFolderName guibg=NONE guifg=NONE")


  vim.cmd("highlight BufferLineFill guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDiagnostics guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineTab guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineTabSelected guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineTabClose guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDuplicate guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDuplicateSelected guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDuplicateVisible guibg=NONE guifg=NONE")

  vim.cmd("highlight BufferLineBackground guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineCloseButton guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineCloseButtonSelected	 guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineCloseButtonVisible	 guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineBufferVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLinePick guibg=NONE")
  vim.cmd("highlight BufferLinePickSelected guibg=NONE")
  vim.cmd("highlight BufferLineSeperator guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineGroupSeperator guibg=NONE guifg=NONE")
  vim.cmd("highlight bufferlineseperatorvisible guibg=none guifg=none")
  vim.cmd("highlight BufferLineSeparatorSelected guibg=none")
  vim.cmd("highlight BufferLineSeparator guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineIndicatorSelected	 guibg=NONE")
  vim.cmd("highlight BufferLineBufferSelected guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDiagnostic	 guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDevIconLuaSelected	 guibg=NONE")
  vim.cmd("highlight BufferLineDevIconDefaultInactive	 guibg=NONE")

  vim.cmd("highlight BufferLineError guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnosticVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorSelected guibg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnostic guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnosticSelected guibg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnosticSelected guibg=NONE")

  vim.cmd("highlight BufferLineWarning guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnosticVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningSelected guibg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnostic guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnosticSelected guibg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnosticSelected guibg=NONE")

  vim.cmd("highlight BufferLineInfo guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnosticVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoSelected guibg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnostic guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnosticSelected guibg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnosticSelected guibg=NONE")

  vim.cmd("highlight BufferLineModified guibg=NONE")
  vim.cmd("highlight BufferLineModifiedSelected guibg=NONE")
  vim.cmd("highlight BufferLineModifiedVisible guibg=NONE guifg=NONE")

  vim.cmd("highlight DiagnosticVirtualTextError guibg=NONE")
  vim.cmd("highlight DiagnosticVirtualTextWarn guibg=NONE")
  vim.cmd("highlight DiagnosticVirtualTextHint guibg=NONE")
  vim.cmd("highlight DiagnosticVirtualTextInfo guibg=NONE")
  vim.cmd("highlight dashboardHeader guifg=114")

  vim.cmd("highlight NormalFloat guifg=NONE guibg=NONE")
  vim.cmd("highlight FloatBorder guifg=255 guibg=Black")
  vim.cmd("highlight WhichKeyFloat guibg=NONE")
end

-- make_codeart_transparent()
