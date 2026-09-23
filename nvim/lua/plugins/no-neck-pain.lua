return {
    "shortcuts/no-neck-pain.nvim",
    enabled = false,
    event = "BufReadPost",
    config = function()
        vim.cmd("NoNeckPain")
    end,
    opts = {},
}
