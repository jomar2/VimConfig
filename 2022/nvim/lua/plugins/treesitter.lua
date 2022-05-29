local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

nvim_treesitter.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  matchup = {
    enable = true,
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  },
  cpp_tools = {
      enable = true,
      preview = {
          quit = 'q', -- optional keymapping for quit preview
          accept = '<tab>' -- optional keymapping for accept preview
      },
  },
}

vim.cmd
[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
]]
