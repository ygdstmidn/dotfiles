return {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        local rainbow_delimiters = require("rainbow-delimiters")

        vim.g.rainbow_delimiters = {
            highlight = {
                "RainbowDelimiterYellow",
                "RainbowDelimiterViolet",
                "RainbowDelimiterCyan",
            },
        }
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#E6C653", force = true })
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#DA70D6", force = true })
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#00BFFF", force = true })
    end,
}
