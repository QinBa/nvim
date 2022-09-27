-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Edit and reload nvim config file quickly
keymap("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
  silent = true,
  desc = "open init.lua",
})

keymap("n", "<leader>sv", "", {
  silent = true,
  desc = "reload init.lua",
  callback = function()
    vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
    vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
  end,
})

-- Basic Edit -- 
-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
keymap("n", "c", '"_c', opts)
keymap("n", "C", '"_C', opts)
keymap("n", "cc", '"_cc', opts)
keymap("x", "c", '"_c', opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Go to the beginning and end of current line in insert mode quickly
keymap("i", "<C-A>", "<HOME>")
keymap("i", "<C-E>", "<END>")

-- Go to beginning of command in command-line mode
keymap("c", "<C-A>", "<HOME>")

-- Delete the character to the right of the cursor
keymap("i", "<C-D>", "<DEL>")

-- Window Management --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- split screen
keymap("n", "<leader>bl", ":vsplit<cr>", opts)
keymap("n", "<leader>bj", ":split<cr>", opts)


-- Resize with arrows
keymap("n", "<S-k>", ":resize -2<CR>", opts)
keymap("n", "<S-j>", ":resize +2<CR>", opts)
keymap("n", "<S-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-l>", ":vertical resize +2<CR>", opts)

-- Buffer Management --
-- Save buffer
keymap("n", "<leader>w", "<cmd>update<cr>", opts)
-- Close buffers
keymap("n", "<leader>q", ":q<cr>", opts)

-- Navigate buffers tab
keymap("n", "<C-.>", ":bnext<CR>", opts)
keymap("n", "<C-,>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap({"i", "c"}, "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
