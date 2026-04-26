return {
    "akinsho/toggleterm.nvim",
    version="*",
    config = function()
        require("toggleterm").setup({
            direction  = "horizontal",
            size = 15,
            persist_wize = true,
            close_on_exit = false,
            start_in_insert = true,
    })

    vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")
    end

}
