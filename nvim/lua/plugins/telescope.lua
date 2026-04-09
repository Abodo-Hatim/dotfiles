return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git" }
            },
        })

        local map = vim.keymap.set
        
        -- find files
        map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
        -- Search in files
        map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
        -- Recent files
        map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files" })
    end,
}
