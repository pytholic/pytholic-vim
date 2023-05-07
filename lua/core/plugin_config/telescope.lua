local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

require("telescope").setup({
	defaults = {
		theme = myTelescopeTheme,
		winblend = 15,
		layout_config = {
			height = 0.8, -- adjust the height of the results window
			width = 0.8, -- adjust the width of the results window
			preview_width = 0.5, -- adjust the width of the preview pane
		},
	},
})
local myTelescopeTheme = {
	-- Define colors for different components
	prompt = "#FF8800", -- Color for the prompt
	selection = "#51AFEF", -- Color for selected items
	border = "#87CEEB", -- Color for borders
	results_bg = "#202328", -- Background color for results
	preview_bg = "#1C1F24", -- Background color for previews
	preview_border = "#87CEEB", -- Color for preview borders
	hover = "#3E4452", -- Color for hovered items
	match_color = "#F89880",
}

-- Define highlighting groups using vim.api.nvim_set_hl
local hl = vim.api.nvim_set_hl

-- Prompt
hl(0, "TelescopePrompt", { foreground = myTelescopeTheme.prompt })

-- Selection
hl(0, "TelescopeSelection", { foreground = myTelescopeTheme.selection, bold = true })
hl(0, "TelescopeMatching", { foreground = myTelescopeTheme.match_color })

-- Border
hl(0, "TelescopeBorder", { foreground = myTelescopeTheme.border })

-- Results
hl(0, "TelescopeResultsNormal", { background = myTelescopeTheme.results_bg })
hl(0, "TelescopeResultsBorder", { foreground = myTelescopeTheme.border })
hl(0, "TelescopeResultsMatch", { foreground = myTelescopeTheme.selection, bold = true })

-- Previews
hl(0, "TelescopePreviewNormal", { background = myTelescopeTheme.preview_bg })
hl(0, "TelescopePreviewBorder", { foreground = myTelescopeTheme.preview_border })

-- Hover
hl(0, "TelescopeHover", { background = myTelescopeTheme.hover })
