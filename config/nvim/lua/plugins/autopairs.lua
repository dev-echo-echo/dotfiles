-- automatic closing for quotes, brackets, parentheses.. --

return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- load when entering insert mode
    config = function()
        local npairs = require("nvim-autopairs")
        npairs.setup({
            check_ts = true,  -- use treesitter to avoid wrong pairings
            disable_filetype = { "TelescopePrompt", "vim" },
        })

        -- integrate with nvim-cmp
        local cmp_status, cmp = pcall(require, "cmp")
        if cmp_status then
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done()
            )
        end
    end
}

