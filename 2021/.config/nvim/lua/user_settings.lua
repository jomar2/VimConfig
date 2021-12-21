-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

additional_plugins = {
  -- You can put your additional plugins here.
  -- Syntax is like normal packer.nvim Syntax. Examples:

  -- { "famiu/feline.nvim", branch = "develop" },

  -- "mhartington/formatter.nvim",

  -- { crispgm/nvim-go", ft = "go" },
}

-- Other settings here
-- For examples for disabling line number:
-- vim.opt.number = false
-- vim.opt.relativenumber = false


-- Or for changing terminal toggle mapping:
-- first argument is mode of mapping. second argument is keymap.
-- third argument is command. and last argument is optional argument like {expr = true}.
-- map("n", "<C-t>", ":ToggleTerm<CR>")
-- map("t", "<C-t>", ":ToggleTerm<CR>")
map('n','n', 'nzzzv')
map('n','N', 'Nzzzv')
map('i','jk', '<esc>')
map('i','kj', '<esc>')
map("v", "y", '"+y')
map("n", "y", '"+y')
map("v", "p", '"+p')
map("n", "p", '"+p')
map('v','kj', '<esc>')
map('v','jk', '<esc>')
--map("n", "<C-V>", '"*p')
--map("i", "<C-V>", '"*p')

map('i',',',',<c-g>u')
map('i','.','.<c-g>u')
map('i','(','(<c-g>u')
map('i',')',')<c-g>u')
map("n","<C-l>","bnext")
map('v','J',":m '>+1<CR>gv=gv")
map('v','K',":m '<-2<CR>gv=gv")

map('i','<C-F>',":Telescope grep_string<CR>")
map('i','<C-t>',":bn<CR>")
map('n','<C-t>',":bn<CR>")
map('v','<C-t>',":bn<CR>")
map('v','<C-F>',":Telescope grep_string<CR>")
map('n','<C-F>',":Telescope grep_string<CR>")
map("i","<C-p>","<esc>:Telescope find_files<CR>")
map("n","<C-p>",":Telescope find_files<CR>")
--map("n","<C-h>","bprev")
map("v","<C-p>","<esc>:Telescope find_files<CR>")
map("n","Q","<nop>")
vim.cmd("com! W w")

map("n","<leader>u",":UndotreeShow<CR>")
user_lualine_style = 1 -- You can choose between 1, 2, 3, 4 and 5
user_indent_blankline_style = 1 -- You can choose between 1, 2, 3, 4,5 and 6
