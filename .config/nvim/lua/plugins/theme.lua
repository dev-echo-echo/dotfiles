-- theme file --

return {
    "folke/tokyonight.nvim",
    lazy = false,     -- load immediately
    priority = 1000,  -- make sure it loads before everything else

    config = function()
        -- THESE MUST BE SET BEFORE colorscheme
        -- add tranparency
        vim.g.tokyonight_transparent = true
        vim.g.tokyonight_transparent_sidebar = true
        vim.g.tokyonight_style = "night"

        -- load colorscheme
        vim.cmd([[colorscheme tokyonight]])

        -- force highlights AFTER load (optional safety)
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
    end
}



