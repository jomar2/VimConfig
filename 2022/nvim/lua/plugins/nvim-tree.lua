local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end
local tree_cb = require"nvim-tree.config".nvim_tree_callback

-- Set alias for vim.g.
local g = vim.g

nvimtree.setup {
  filters = {
      custom= { ".git", "node_modules", ".cache", "__pycache__"}, -- Ignore these types in listing.
      dotfiles = true,
  },
  open_on_tab = false,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  actions = {
      open_file ={
          window_picker ={
              exclude = {
                  filetype = {'packer', 'vista_kind'},
                  buftype = {'terminal'},
              },
          },
          quit_on_open = false,
      },
  },
  renderer = {
      indent_markers = {
          enable=true,
      },
      highlight_git = true,
      highlight_opened_files = "none",
      add_trailing = false,
  },
  view = {
    width = "20%",
    side = "left",
    mappings = {
      list = {
       {key = "<S-h>", cb = ":call ResizeLeft(3)<CR>"},
       {key = "<C-h>", cb = tree_cb("toggle_dotfiles")},
      }
    }
  }
}

