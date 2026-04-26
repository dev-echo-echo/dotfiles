-- this file is fore kemaps
-- use space as a modifier
vim.g.mapleader = " "
vim.g.maplocalleader= " "


local map = vim.keymap.set

 -- movements --
-- "n" → normal mode
-- "i" → insert mode
-- "v" → visual mode
-- "x" → visual block
-- "s" → select mode
-- "o" → operator-pending
-- "c" → command-line
local map = vim.keymap.set
local modes = { "n", "v", "x", "s", "o" } -- all modes

for _,mode in ipairs(modes) do
    map(mode, "j", "h")  -- left
    map(mode, "k", "k")  -- up
    map(mode, "l", "j")  -- down
    map(mode, "m", "l")  -- right
end

-- toggle neo-tree --
map("n", "<S-Tab>", ":Neotree toggle<CR>", {desc = "toggle Neotree"} ,opts)

-- moves between opened tabs
map("n", "<S-j>", "gT", {desc = "move between opened tabs"})
map("n", "<S-m>", "gt", {desc = "move between opened tabs"})

-- move left and right when spliting window --
map("n", "<C-j>", "<C-w>h", {desc = "move left when spliting window"})
map("n", "<C-m>", "<C-w>l", {desc = "move right when spliting window"})
