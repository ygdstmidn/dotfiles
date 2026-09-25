return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local parsers = {
            "cpp",
            "lua",
            "markdown",
            "markdown_inline",
            "latex",
            "bash",
        }
        require("nvim-treesitter").setup()
        require("nvim-treesitter").install(parsers)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = parsers,
            callback = function()
                vim.schedule(function()
                    vim.treesitter.start()
                end)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
