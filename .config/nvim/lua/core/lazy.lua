-- plugin manager --

-- what is a plugin manager ?
-- Plugin Manger is a tool that:
-- downloads plugins
-- load them
-- update them
-- Without it:
-- you manually clone repos
-- you suffer
-- you quit and install VS Code( no i will not)

-- vim.fn.stdpath is neovim's data folder example path: ~/.local/share/nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- clone lazy.nvim if missing
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

-- add to runtime path
vim.opt.rtp:prepend(lazypath)

-- safely require lazy.nvim
local ok, lazy = pcall(require, "lazy")
if not ok then
  error("lazy.nvim not found")
end

-- start with no plugins , you call plugins here and lazy.lua handles them
lazy.setup({
        require("plugins.neotree"),
        require("plugins.cmp"),
        --require("plugins.theme"),
        require("plugins.catppuccin"),
        require("plugins.autopairs"),
        --require("plugins.noice"),
        require("plugins.lualine"),
        require("plugins.indent_blankline"),
        require("plugins.lspconfig"),
        require("plugins.toggleterm"),
})

