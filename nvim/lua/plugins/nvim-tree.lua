return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                group_empty = true,
                icons = {
                    show = {
                        file = true,
                        folder = true,
                    },
                },
            },
            filters = {
                dotfiles = false,
            },
        })

        -- Open/close tree with Ctrl+e
        vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    end,
}
