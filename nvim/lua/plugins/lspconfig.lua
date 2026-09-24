return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--query-driver=/home/maheo/.platformio/packages/toolchain-gccarmnoneeabi@*/bin/arm-none-eabi-*",
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
    end,
}
