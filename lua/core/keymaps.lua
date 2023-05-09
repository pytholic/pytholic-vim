vim.g.mapleader = " "

vim.keymap.set("v", "=", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "-", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remap ctrl-/ for vertical split
vim.api.nvim_set_keymap("n", "<leader>/", ":vsplit<CR>", { noremap = true, silent = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- grep remap --
vim.api.nvim_set_keymap("n", "<leader>vg", [[:vimgrep /input/ %:p<Left><Left><Left><Left><Left>]], { noremap = true })

vim.keymap.set("n", ".", "<cmd>cnext<CR>zz")
vim.keymap.set("n", ",", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- nvim tree --
vim.keymap.set("n", "<leader>t", "<cmd>:NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>n", "<cmd>:NvimTreeFindFileToggle<CR>", { silent = true })

-- Remap Tab and Shift-Tab for indenting and unindenting
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.smart_tab()", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.smart_shift_tab()", { noremap = true, silent = true, expr = true })
-- Define the smart_tab() and smart_shift_tab() functions
-- function _G.smart_tab()
--     return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
-- end
function _G.smart_tab()
	if vim.fn.mode() == "i" then -- fixed the issue where it wrote <tab> in insert mode
		return "\t"
	else
		return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
	end
end

function _G.smart_shift_tab()
	return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end

-- toggleterm keymaps --
vim.keymap.set("n", "<leader>lg", "<cmd>:lua _LAZYGIT_TOGGLE()<CR>")

-- coderunner remaps --
vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- cmake and make keymaps --
-- Keymap for running 'cmake -S . -B build'
vim.api.nvim_set_keymap("n", "<leader>cm", ":!cmake -S . -B build<CR>", { noremap = true })
-- Keymap for running 'make -C build'
vim.api.nvim_set_keymap("n", "<leader>mk", ":!make -C build<CR>", { noremap = true })

-- clang formatter --
-- Automatic formatting on save
vim.cmd([[autocmd BufWritePre *.cpp,*.h,*.cc,*.hpp,*.cxx,*.hxx,*.c,*.h silent! execute 'ClangFormat']])

-- Manually trigger formatting with a key mapping
vim.api.nvim_set_keymap("n", "<leader>cf", ":ClangFormat<CR>", { silent = true })

-- nvim-dap keymaps --
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>B", function()
	require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<leader>dl", function()
	require("dap").run_last()
end)

vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
