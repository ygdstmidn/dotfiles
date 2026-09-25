return {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
        { "<leader>md", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
    },
    ft = "markdown",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
}
