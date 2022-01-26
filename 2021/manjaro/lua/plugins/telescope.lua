local present, telescope = pcall(require, "telescope")
if not present then
    return
end

-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


telescope.setup {
    extensions = {
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg"
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
}
telescope.load_extension("fzf")

map('i','<C-F>',":Telescope grep_string <CR>")
map('v','<C-F>',"<y> :Telescope grep_string <p> <CR>")
map('n','<C-F>',":Telescope grep_string<CR>")
map("i","<C-p>","<esc>:Telescope find_files<CR>")
map("n","<C-p>",":Telescope find_files<CR>")
map("v","<C-p>","<esc>:Telescope find_files<CR>")

