return {
    "petertriho/nvim-scrollbar",
    dependencies = {
        "lewis6991/gitsigns.nvim",
    },
    branch = "refactor/v2",
    event = "VeryLazy",
    opts = {
        exclude = {
            filetypes = {
                "no-neck-pain",
            },
        },
        providers = {
            gitsigns = true,
        },
    },
}
