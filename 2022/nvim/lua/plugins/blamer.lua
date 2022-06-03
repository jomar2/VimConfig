--[[

let g:blamer_delay = 500
Show in visual modes
Enables / disables blamer in visual modes.

Default: 1

let g:blamer_show_in_visual_modes = 0
Show in insert modes
Enables / disables blamer in insert modes.

Default: 1

let g:blamer_show_in_insert_modes = 0
Prefix
The prefix that will be added to the template.

Default: ' '

let g:blamer_prefix = ' > '
Template
The template for the blame message that will be shown.

Default: '<committer>, <committer-time> • <summary>'

Available options: <author>, <author-mail>, <author-time>, <committer>, <committer-mail>, <committer-time>, <summary>, <commit-short>, <commit-long>.

let g:blamer_template = '<committer> <summary>'
Date format
The format of the date fields. (<author-time>, <committer-time>)

Default: '%d/%m/%y %H:%M'

let g:blamer_date_format = '%d/%m/%y'
Relative time
Shows commit date in relative format

Default: 0

let g:blamer_relative_time = 1
Highlight
The color of the blame message.

Default: link Blamer Comment

highlight Blamer guifg=lightgrey
]]--
highlight Blamer guifg=lightgrey
vim.g.blamer_prefix = ' > '
vim.g.blamer_show_in_insert_modes = 0
vim.g.blamer_show_in_visual_modes = 0
vim.g.blamer_delay = 500
vim.g.blamer_template = '<committer> <summary>'
vim.g.blamer_date_format = '%d/%m/%y'
highlight Blamer guifg=lightgrey

