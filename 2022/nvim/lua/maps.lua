-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Map leader key to space.
vim.g.mapleader = " "


-- Set cl for clearing highlights after searching word in file.
map("n", "cl", ":noh<CR>")


-- Split navigations.
map("n", "<A-j>", "<C-w><C-j>")
map("n", "<A-k>", "<C-w><C-k>")
map("n", "<A-l>", "<C-w><C-l>")
map("n", "<A-h>", "<C-w><C-h>")


-- Buffer resizing.
map("n", "<S-h>", ":call ResizeLeft(3)<CR><Esc>")
map("n", "<S-l>", ":call ResizeRight(3)<CR><Esc>")
map("n", "<S-k>", ":call ResizeUp(1)<CR><Esc>")
map("n", "<S-j>", ":call ResizeDown(1)<CR><Esc>")


-- Buffer switching.
map("n", "<A-[>", ":BufferLineCyclePrev<CR>")
map("n", "<A-]>", ":BufferLineCycleNext<CR>")

-- Buffer closing.
map("n", "<leader>bc", ":BufferLinePickClose<CR>")

-- Buffer moving.
map("n", "<leader>bl", ":BufferLineMoveNext<CR>")
map("n", "<leader>bh", "::BufferLineMovePrev<CR>")


-- NvimTree toggle
map("n", "<leader>nt", ":NvimTreeToggle<CR>")


-- Telescope.
map("n", "<Leader>fw", ":Telescope live_grep<CR>")
map("n", "<Leader>gt", ":Telescope git_status<CR>")
map("n", "<Leader>cm", ":Telescope git_commits<CR>")
map("n", "<Leader>ff", ":Telescope find_files find_command=rg,--follow,--hidden,--files<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>fo", ":Telescope oldfiles<CR>")
map("n", "<Leader>th", ":Telescope colorscheme<CR>")
map("n", "<Leader>tt", ":Telescope resume<CR>")
map("v", '<Leader>fw', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>')
map("n", '<Leader>fW', 'viwy<ESC>:Telescope live_grep default_text=<c-r>0<CR>')
map('n', "<leader>frc", ":lua require('telescope.builtin').find_files({prompt_title = '< VimRC >', cwd = '$HOME/.config/nvim',hidden = true})<CR>")
map("n", "<leader>pw",":lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>')}<CR>")
map("n", "<leader>pb",":lua require('telescope.builtin').buffers()<CR>")
map("i", "<C-p>", "<esc>:lua require('telescope.builtin').git_files()<CR>")
map("n", "<C-p>", ":lua require('telescope.builtin').git_files()<CR>")
map("v", "<C-p>", "<esc>:lua require('telescope.builtin').git_files()<CR>")


-- Dashboard
map("n", "<Leader>db", ":Dashboard<CR>")
map("n", "<Leader>fn", ":DashboardNewFile<CR>")
map("n", "<Leader>bm", ":DashboardJumpMarks<CR>")
map("n", "<C-s>l", ":SessionLoad<CR>")
map("n", "<C-s>s", ":SessionSave<CR>")

-- Harpoon
local silent_opts = { noremap=true, silent=true }
map("n", "<leader>ta", ":lua require('harpoon.mark').add_file()<CR>",silent_opts)
map("n", "<leader>tl", ":lua require('harpoon.ui').toggle_quick_menu()<CR>",silent_opts)
map("n", "<leader>tc", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>",silent_opts)

map("n", "<leader>j", ":lua require('harpoon.ui').nav_file(1)<CR>",silent_opts)
map("n", "<leader>h", ":lua require('harpoon.ui').nav_file(2)<CR>",silent_opts)
map("n", "<leader>l", ":lua require('harpoon.ui').nav_file(3)<CR>",silent_opts)
map("n", "<leader>ö", ":lua require('harpoon.ui').nav_file(4)<CR>",silent_opts)


-- Lsp
local lsp_opts = { noremap=true, silent=true }
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", lsp_opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", lsp_opts)
map("n", "<leader>k", ":lua vim.lsp.buf.hover()<CR>", lsp_opts)
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", lsp_opts)
map("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", lsp_opts)
map("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", lsp_opts)
map("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", lsp_opts)
map("n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", lsp_opts)
map("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", lsp_opts)
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", lsp_opts)
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", lsp_opts)
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", lsp_opts)
map("n", "<leader>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", lsp_opts)
map("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>", lsp_opts)
map("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>", lsp_opts)
map("n", "<leader>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>", lsp_opts)


-- -- Dap
-- map("n", "<F5>", ":lua require(\"dap\").continue()<CR>")
-- map("n", "<leader>te", ":lua require(\"dap\").terminate()<CR>")
-- map("n", "<leader>br", ":lua require(\"dap\").toggle_breakpoint()<CR>")
-- map("n", "<leader>Br", ":lua require(\"dap\").set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- map("n", "<leader>lp", ":lua require(\"dap\").set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
-- map("n", "<F10>", ":lua require(\"dap\").step_over()<CR>")
-- map("n", "<F11>", ":lua require(\"dap\").step_into()<CR>")
-- map("n", "<leader>sb", ":lua require(\"dap\").step_back()<CR>")
-- map("n", "<F12>", ":lua require(\"dap\").step_out()<CR>")
-- map("n", "<leader>rc", ":lua require(\"dap\").run_to_cursor()<CR>")
-- map("n", "<leader>ro", ":lua require(\"dap\").repl.open()<CR>")
-- map("n", "<leader>dt", ":lua require(\"dapui\").toggle()<CR>")
-- map("n", "<leader>dl", ":lua require(\"dap\").run_last()<CR>")


function _G.set_terminal_keymaps()
  map("t", "<esc>", "<C-\\><C-n>")
  map("t", "<A-h>", "<c-\\><c-n><c-w>h")
  map("t", "<A-j>", "<c-\\><c-n><c-w>j")
  map("t", "<A-k>", "<c-\\><c-n><c-w>k")
  map("t", "<A-l>", "<c-\\><c-n><c-w>l")

  map("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
  map("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
  map("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
  map("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")


-- Remove unnecessary white spaces.
map("n", "<leader>cw", ":StripWhitespace<CR>")

-- TrueZen focus mode.
map("n", "<leader>fs", ":TZFocus<CR>")


-- comment
map("n", "<leader>ct", ":CommentToggle<CR>")
map("v", "<leader>ct", ":'<,'>CommentToggle<CR>")

map("v", "<leader>d", '"_d')
map("n", "<leader>d", '"_d')


map("i","<C-c>", "<esc>")
map("i","<S-Up>", "<Up>")
map("n","<S-Up>", "<Up>")
map("v","<S-Up>", "<Up>")
map("i","<S-Down>", "<Down>")
map("n","<S-Down>", "<Down>")
map("v","<S-Down>", "<Down>")

map('n','n', 'nzzzv')
map('n','N', 'Nzzzv')
map("v", "y", 'ygv<esc>')
map('i',',',',<c-g>u')
map('i','.','.<c-g>u')
map('i','(','(<c-g>u')
map('i',')',')<c-g>u')
map("n","<C-l>","bnext")
map('v','J',":m '>+1<CR>gv=gv")
map('v','K',":m '<-2<CR>gv=gv")
map("i","<C-p>","<esc>:Telescope find_files<CR>")
map("v","<C-p>","<esc>:Telescope find_files<CR>")
map("n","<C-p>",":Telescope find_files<CR>")
map("n","Q","<nop>")
vim.cmd("com! W w")
vim.cmd("com! Q q")

map("n","<leader>u",":UndotreeShow<CR>")
vim.cmd("autocmd! FileType help wincmd L")
--
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
--
-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
--
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

-- Code formatter.
-- map("n", "<leader>fr", ":Neoformat<CR>", lsp_opts)
