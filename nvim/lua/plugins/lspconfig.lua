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
    end,
}
