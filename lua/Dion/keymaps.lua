-- Setting Some variables
local map_opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local key_map = vim.api.nvim_set_keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.user_emmet_leader_key = ","

key_map("", "<Space>", "<Nop>", map_opts)

-- Normal Mode mapping
-----------------------
-- Change all the word below cursor 
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable with leader x, instead of having to save file and chmod +x
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


--mapping the Shift q to quote hover words
key_map("n", "<S-q>", 'ciw"<C-R>-"', map_opts)
key_map("v", "<S-q>", '"vi(c"<C-R>-"', map_opts)

-- mapping tabnew and tabclose , and Bdelete(command with bufferline)
key_map("n", "<tab>n", ":tabnew<CR>", map_opts)
key_map("n", "<tab>c", ":tabclose<CR>", map_opts)
key_map("n", "<tab>d", ":Bdelete %<CR>", map_opts)
-- Moving between window with <Control> + direction rather than with <Control> + w + Direction
key_map("n", "<C-h>", "<C-w>h", map_opts)
key_map("n", "<C-j>", "<C-w>j", map_opts)
key_map("n", "<C-k>", "<C-w>k", map_opts)
key_map("n", "<C-l>", "<C-w>l", map_opts)

-- Resize window with <Control> + arrow
key_map("n", "<C-Left>", ":vertical resize -2<CR>", map_opts)
key_map("n", "<C-Right>", ":vertical resize +2<CR>", map_opts)
key_map("n", "<C-Up>", ":resize +2<CR>", map_opts)
key_map("n", "<C-Down>", ":resize -2<CR>", map_opts)

-- Move between buffer with <Shift> + l , h
key_map("n", "<S-l>", ":bnext<CR>", map_opts)
key_map("n", "<S-h>", ":bprevious<CR>", map_opts)

-- Toggle Plexplore (Explore file system panel) with <Control> + e(explore)  replaced with nvim tree
key_map("n", "<leader>e", ":NvimTreeToggle<cr>", map_opts)

-- Open new window with <Tab> + L or <Tab> + j
key_map("n", "<tab>l", ":vsplit<CR>", map_opts)
key_map("n", "<tab>j", ":split<CR>", map_opts) -- Open the $MYVIMRC
key_map("n", "<tab>ev", ":vsplit $MYVIMRC<CR>", map_opts)
key_map("n", "<tab>sr", ":source $MYVIMRC<CR>", map_opts)

-- Visual Mode Mapping
----------------------

-- When Highlight lines or block of code, use right arrow to index and revert
key_map("v", "<", "<gv", map_opts)
key_map("v", ">", ">gv", map_opts)

--when Hightlight lines or block of code, use <ALT> key + up and down arrow to move that part up and down
key_map("v", "<A-j>", ":m .+1<CR>==", map_opts)
key_map("v", "<A-k>", ":m .-2<CR>==", map_opts)
key_map("x", "J", ":move '>+1<CR>gv-gv", map_opts)
key_map("x", "K", ":move '<-2<CR>gv-gv", map_opts)
key_map("x", "<A-j>", ":move '>+1<CR>gv-gv", map_opts)
key_map("x", "<A-k>", ":move '<-2<CR>gv-gv", map_opts)

--when we paste something on top of another, the current object in vim memory got replace, this map "disable" that behavior"
key_map("v", "p", "_dP", map_opts)

-- for folding in virtual mode to ` and ``
key_map("x", "``", "zf", map_opts)
key_map("n", "`", "za", map_opts)

-- Mapping for telescope
key_map(
	"n",
	"<leader>t",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	term_opts
)
key_map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", term_opts)
-- key_map("n" , "<leader>b", "<cmd>Telescope file_browser<cr>", term_opts)

-- Use When in terminal mode with :terminal
-------------------------------------------
key_map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
key_map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
key_map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
key_map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Mapping jk to <esc>
key_map("v", "jk", "<esc>", map_opts)
key_map("i", "jk", "<esc>", map_opts)

