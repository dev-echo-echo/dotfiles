-- editor behavior --
-- vim is a global table 
-- table = a container that holds things
-- think of it like a box with many tools inside
-- example:
-- vim.api
-- vim.fn
-- vim keymap
-- vim.opt
-- vim.opt is a special table for editor options
-- option = setting that changes editor behavior

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = false

opt.termguicolors = true

-- change style
--im.g.tokyonight_style = "night"

-- add transparency
--vim.g.tokyonight_transparent_sidebar = true
--vim.g.tokyonight_transparent = true

-- nvim aliases --
vim.cmd("cnoreabbrev tf tabfind")
-- this has a problem a dead one for example :let stuff = 1 --
-- tf in stuff could expand into tabfind tha is bad -- 
-- well that happens only when you use on letter --

