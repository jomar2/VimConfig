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
        file_ignore_patterns = {"%.idx","%.o", "%.cpp.o"},
        sorting_strategy = "ascending",
        path_display = {"smart"},
        scroll_strategy = "limit",
        layout_config = {
            prompt_position = "top",
        },
        preview = {
            hide_on_startup=true,
        },
    },
}
telescope.load_extension("fzf")

