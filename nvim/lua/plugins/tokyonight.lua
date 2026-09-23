return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    event = "VeryLazy",
    opts = {},
    config = function()
        vim.cmd.colorscheme("tokyonight-night")
    end,
}
