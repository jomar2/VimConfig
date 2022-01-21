-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
additional_plugins = {
{'ThePrimeagen/vim-be-good'},
-- { crispgm/nvim-go', ft = 'go'}
}
-- Other settings here-- For examples for disabling line number:-- vim.opt.number = false-- vim.opt.relativenumber = false

-- Or for changing terminal toggle mapping:-- first argument is mode of mapping. second argument is keymap.-- third argument is command. and last argument is optional argument like {expr = true}.-- map('n', '<C-t>', ':ToggleTerm<CR>')-- map('t', '<C-t>', ':ToggleTerm<CR>')-- cnoreabbrev Q q
map('n','Y','y$')
map('n','n', 'nzzzv')
map('n','N', 'Nzzzv')
map('i','jk', '<esc>')
map('i','kj', '<esc>')
map('v','jk', '<esc>')
map('v','kj', '<esc>')
map("v", "y", '"+y')
map("n", "y", '"+y')
map("v", "p", '"+p')
map("n", "p", '"+p')
map("n", "<C-V>", '"*p')
map("i", "<C-V>", '"*p')
map('i',',',',<c-g>u')
map('i','.','.<c-g>u')
map('i','(','(<c-g>u')
map('i',')',')<c-g>u')
map('v','J',":m '>+1<CR>gv=gv")
map('v','K',":m '<-2<CR>gv=gv")
map('i','<C-F>',":Telescope grep_string<CR>")
map('v','<C-f>','"zy:Telescope live_grep default_text= <C-r>z<CR>')
map('n','<C-F>',":Telescope grep_string<CR>")
map("i","<C-p>","<esc>:Telescope find_files<CR>")
map("n","<C-p>",":Telescope find_files<CR>")
map("v","<C-p>","<esc>:Telescope find_files<CR>")

-- Other settings here
-- For examples for disabling line number:
-- vim.opt.number = false
-- vim.opt.relativenumber = false


-- Or for changing terminal toggle mapping:
-- first argument is mode of mapping. second argument is keymap.
-- third argument is command. and last argument is optional argument like {expr = true}.
-- map('n', '<C-t>', ':ToggleTerm<CR>')
-- map('t', '<C-t>', ':ToggleTerm<CR>')
