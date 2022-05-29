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
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
    defaults = {
        layout_config = {
            prompt_position = 'top',
        },
        git_files = {
            show_untracked = false,
        },
    },
}
telescope.load_extension("fzf")

