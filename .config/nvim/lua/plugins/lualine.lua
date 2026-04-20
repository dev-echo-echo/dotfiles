-- lua/plugins/lualine.lua
-- for bottom status bar 
-- shows: mode, file name, pistion ...
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
    config = function()
        require("lualine").setup({
            options = {
                theme = "tokyonight",
                section_separators = "",
                component_separators = "",
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch", "diff", "diagnostics"},
                lualine_c = {"filename"},
                lualine_x = {"encoding", "fileformat", "filetype"},
                lualine_y = {"progress"},
                lualine_z = {"location"}
            }
        })
    end
}

