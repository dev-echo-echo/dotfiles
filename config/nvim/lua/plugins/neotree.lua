-- file search --
-- lua/plugins/neotree.lua
--
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",  -- lazy-load only when :Neotree is called
    config = function()
        -- THIS IS YOUR CUSTOM SETUP
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },
            window = {
                mappings = {
                    ["j"] = "left",
                    ["k"] = "up",
                    ["l"] = "down",
                    ["m"] = "right",
                    ["<C-j>"] = "focus",
                }
            }
        })
    end
}

