-- lua/plugins/noice.lua
-- enhance command line(fuzzy search ,autocomple for command, better visuals for messages )
return {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("noice").setup({
            cmdline = {
                enabled = true,      -- enable : commands enhancement
                view = "cmdline",    -- show command line in popup
            },
            messages = {
                enabled = true,      -- enable nicer messages
            },
            routes = {
                { filter = { event = "msg_show" }, view = "mini" }
            }
        })
    end
}

