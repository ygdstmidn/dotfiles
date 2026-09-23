return {
    "petertriho/nvim-scrollbar",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "kevinhwang91/nvim-hlslens",
    },
    event = "VeryLazy",
    opts = {
        handlers = {
            gitsigns = true,
            search = true,
        },
    },
    config = function()
        require("scrollbar").setup()
        require("gitsigns").setup()
        require("hlslens").setup()
        require("scrollbar.handlers.gitsigns").setup()
        require("scrollbar.handlers.search").setup()
    end,
}
