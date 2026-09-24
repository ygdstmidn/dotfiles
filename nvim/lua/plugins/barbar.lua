return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    -- event = "VeryLazy", -- 遅いとむかつく．．．
    opts = {
        animation = false, -- 開始直後にずらっとなるのが嫌かも．．
        sidebar_filetypes = {
            ["no-neck-pain"] = {},
        },
    },
    config = function(_, opts)
        require("barbar").setup(opts)
        vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
    end,
}
