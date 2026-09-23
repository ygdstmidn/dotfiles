return {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                c = { "clang-format" },
                cpp = { "clang-format" },
                lua = { "stylua" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end,
}
