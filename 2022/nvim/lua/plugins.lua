local use = require("packer").use

return require("packer").startup({function()
    use { "wbthomason/packer.nvim" }

    -- Color schemes.
    use { "folke/tokyonight.nvim" }
    use { "bluz71/vim-nightfly-guicolors" }
    use { "bluz71/vim-moonfly-colors" }
    use { "shaunsingh/nord.nvim" }
    use { "navarasu/onedark.nvim" }
    use { "wuelnerdotexe/vim-enfocado" }
    use { "tomasiser/vim-code-dark" }
    use {
        "Mofiqul/vscode.nvim",
        --     config = function ()
        --         -- For dark theme
        --         vim.g.vscode_style = "dark"
        --         -- For light theme
        --         vim.g.vscode_style = "light"
        --         -- Enable transparent background
        --         vim.g.vscode_transparent = 1
        --         -- Enable italic comment
        --         vim.g.vscode_italic_comment = 1
        --         -- Disable nvim-tree background color
        --         vim.g.vscode_disable_nvimtree_bg = true
        --         vim.cmd([[colorscheme vscode]])
        --     end
    }
    -- vim game
    use {"theprimeagen/vim-be-good"}
    use {"ellisonleao/glow.nvim", branch = 'main'}
    -- OrgMode
    --[[    use {
    'nvim-orgmode/orgmode',
    after="nvim-treesitter",
    config = function()
    require('orgmode').setup{}
    require("plugins/orgmode")
    end
    }
    ]]--

    -- use {
    --     "wfxr/minimap.vim",
    --     config = function()
    --        vim.cmd(":!cargo install --locked code-minimap")
    --     end
    -- }

    use {
        "ThePrimeagen/harpoon",
        event = "BufEnter",
        config = function()
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
            }
        end
    }
    -- GitLens functionality
    use {
        "APZelos/blamer.nvim",
        cmd = {"BlamerToggle"},
        config = function()
            --require('blamer').setup{}
            require("plugins/blamer")
        end
    }
    -- -- This plugin adds indentation guides to all lines (including empty lines).
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufEnter",
        config = function()
            require("plugins/indent-blankline")
        end
    }

    use {
        "RishabhRD/nvim-cheat.sh",
        cmd = {
            "Cheat",
            "CheatWithoutComments",
            "CheatList",
            "CheatListWithoutComments",
        },
        requires = {
            'RishabhRD/popfix',
        },
    }
    -- This plugin show trailing whitespace.
    use {
        "ntpeters/vim-better-whitespace",
        event = "BufRead",
        config = function()
            require("plugins/better-whitespace")
        end
    }
    -- Sandwich surround plugin
    -- use {
    --     "machakann/vim-sandwich",
    --     event = "BufRead",
    -- }
    -- Icons.
    use {
        "kyazdani42/nvim-web-devicons",
        event = "BufEnter"
    }
    -- treesitter context.
    use {
        "lewis6991/nvim-treesitter-context",
        cmd = {
            "TSContextToggle",
            "TSContextEnable",
            "TSContextDisable",
        },
        config = function()
            require'treesitter-context'.setup{
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                -- For all filetypes
                -- Note that setting an entry here replaces all other patterns for this entry.
                -- By setting the 'default' entry below, you can control which nodes you want to
                -- appear in the context window.
                default = {
                    'class',
                    'function',
                    'method',
                    -- 'for', -- These won't appear in the context
                    -- 'while',
                    -- 'if',
                    -- 'switch',
                    -- 'case',
                },
                -- Example for a specific filetype.
                -- If a pattern is missing, *open a PR* so everyone can benefit.
                --   rust = {
                --       'impl_item',
                --   },
            },
            exact_patterns = {
                -- Example for a specific filetype with Lua patterns
                -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
                -- exactly match "impl_item" only)
                -- rust = true,
            },
        }
    end
}




-- File explorer tree.
use {
    "kyazdani42/nvim-tree.lua",
    event = "BufEnter",
    cmd = {
        "NvimTreeOpen",
        "NvimTreeFocus",
        "NvimTreeToggle",
    },
    requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
        require('nvim-tree').setup()
    end
}
-- Undo Tree
use {
    "mbbill/undotree",
    cmd = {
        "UndotreeShow",
        "UndotreeFocus",
        "UndotreeToggle",
        "UndotreeHide",

    }
}
-- Bufferline.
use {
    "akinsho/nvim-bufferline.lua",
    after = "nvim-web-devicons",
    config  = function()
        require("plugins/bufferline")
    end
}

-- -- MultiCursors
-- use {
--     "mg979/vim-visual-multi",
-- }

-- Statusline.
use {
    "nvim-lualine/lualine.nvim",
    after = "nvim-bufferline.lua",
    config = function ()
        require("plugins/lualine")
    end
}

-- TreeSitter.
use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufRead",
    cmd = {
        "TSInstall",
        "TSInstallSync",
        "TSBufEnable",
        "TSBufToggle",
        "TSEnableAll",
        "TSInstallFromGrammer",
        "TSToggleAll",
        "TSUpdate",
        "TSUpdateSync"
    },
    config = function()
        require("plugins/treesitter")
    end
}

-- Colorizer (for highlighting color codes).
use {
    "norcalli/nvim-colorizer.lua",
    event = "BufEnter",
    config = function()
        require("plugins/colorize")
        vim.cmd("ColorizerAttachToBuffer")
    end
}

-- Startup screen.
use {
    "glepnir/dashboard-nvim",
    config = function()
        require('plugins/dashboard')
    end
}
    -- event = "VimEnter",
    -- cmd = {
    --     "Dashboard",
    --     "DashboardChangeColorscheme",
    --     "DashboardFindFile",
    --     "DashboardFindHistory",
    --     "DashboardFindWord",
    --     "DashboardNewFile",
    --     "DashboardJumpMarks",
    --     "SessionLoad",
    --     "SessionSave"
    -- },
--     config = function()
--         local db = require("plugins/dashboard")
--     end
-- }

use {
    "nvim-lua/plenary.nvim",
}

use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
}
use {
    "artart222/telescope_find_directories",
}
use {
    "nvim-telescope/telescope.nvim",
    config = function()
        require("plugins/telescope")
    end
}

-- LSP, LSP installer and tab completion.
use {
    "neovim/nvim-lspconfig",
}

-- " LSP Extensions
use {
    "nvim-lua/lsp_extensions.nvim",
    after = "nvim-lspconfig",
}

use {
    "williamboman/nvim-lsp-installer",
    after = "nvim-lspconfig",
    config = function()
        require("../lsp")
    end
}
use {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter"
}
use {
    "rafamadriz/friendly-snippets",
}
use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
        require("plugins/cmp")
    end
}
use {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp"
}
use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
}
use {
    "hrsh7th/cmp-nvim-lsp",
    after = "nvim-lsp-installer"
}
use {
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp"
}
use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip"
}

-- LSP signature.
use {
    "ray-x/lsp_signature.nvim",
    after = "friendly-snippets",
    config = function ()
        require("lsp_signature").setup()
    end
}

-- VsCode like pictograms for lsp.
use {
    "onsails/lspkind-nvim",
    -- after = "friendly-snippets"
}


-- Code formatter.
use {
    "sbdchd/neoformat",
    cmd = "Neoformat"
}

-- -- View and search LSP symbols, tags in Neovim.
-- use {
--     "liuchengxu/vista.vim",
--     cmd = "Vista",
--     config = function ()
--         require("plugins/vista")
--     end
-- }
-- Git support for nvim.
use {
    "tpope/vim-fugitive",
    cmd = "Git"
}

-- Git signs.
use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
        require("gitsigns").setup()
    end
}

-- This is for html and it can autorename too!
use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
}

-- Scrollbar.
use {
    "dstein64/nvim-scrollview",
    event = "BufRead",
    config = function()
        require("plugins/nvim-scroll")
    end
}

-- Smooth scroll.
-- use {
--     "karb94/neoscroll.nvim",
--     event = "BufRead",
--     config = function()
--         require("neoscroll").setup()
--     end
-- }
-- todo-comments is a lua plugin for Neovim to highlight and search for
-- todo comments like TODO, HACK, BUG in code base.
use {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    config = function()
        require("plugins/todo-comments")
    end
}

-- WhichKey is a lua plugin that displays a popup with possible
-- key bindings of the command you started typing.
use { "folke/which-key.nvim" }

-- A plugin for neovim that automatically creates missing directories
-- on saving a file.
use {
    "jghauser/mkdir.nvim",
    cmd = "new",
    config = function()
        require("mkdir")
    end
}

-- Neovim plugin to comment text in and out.
-- Supports commenting out the current line, a visual selection and a motion.
use {
    "terrortylor/nvim-comment",
    cmd = "CommentToggle",
    config = function()
        require("nvim_comment").setup()
    end
}

-- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
use { "andymass/vim-matchup" }

-- With this plugin you can resize Neovim buffers easily.
use {
    "artart222/vim-resize",
    event = "BufEnter"
}

-- Import settings of plugins or start plugins.
require("which-key").setup()

end,
config = {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end
    }
}})
