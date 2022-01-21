local present, telescope = pcall(require, "telescope")
if not present then
    return
end

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
  defaults = {
    path_display = {"truncate"},
  }
}
telescope.load_extension('fzf')
