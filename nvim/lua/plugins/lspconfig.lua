return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local home = os.getenv("HOME")
        local platformio_path = home
            .. "/.platformio/packages/toolchain-gccarmnoneeabi@*/bin/arm-none-eabi-*"
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--query-driver=" .. platformio_path,
            },
        })
        vim.lsp.enable("clangd")
        -- 警告を消すために，doxygenをファイルタイプとして追加(意味はない)
        vim.filetype.add({
            extension = {
                ["c.doxygen"] = "c.doxygen",
                ["cpp.doxygen"] = "cpp.doxygen",
            },
        })

        -- 定数を定数の色で表示
        vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly", {
            link = "Constant",
        })
        -- static変数を変数の色で表示
        vim.api.nvim_set_hl(0, "@lsp.typemod.variable.static", {
            link = "@lsp.type.variable",
        })
    end,
}
