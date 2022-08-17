require('nvim-tree').setup{
	disable_netrw = true,
	update_cwd = true,
	auto_reload_on_write = true,
	open_on_tab = false,
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	renderer = {
		indent_markers = {
			enable = true
		},
		icons = {
			webdev_colors = true,
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "",
					ignored = "◌"
				},
		}
		},
		highlight_git = false,
		special_files = {},
	},
	git = {
		enable = true,
		ignore = false,
	},
	filters = {
		dotfiles = false,
		custom = { '.git' },
	},
	view = {
		mappings = {
			list = {
				{ key = 't', action = 'tabnew' },
			}
		}
	},
}
