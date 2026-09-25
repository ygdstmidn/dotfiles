return {
    "hrsh7th/nvim-cmp",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },

    event = { "InsertEnter", "VeryLazy" },

    config = function()
        local cmp = require("cmp")

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),

            vim.keymap.set("n", "gd", vim.lsp.buf.definition),
            vim.keymap.set("n", "gr", vim.lsp.buf.references),
            vim.keymap.set("n", "K", vim.lsp.buf.hover),
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename),

            sources = {
                { name = "nvim_lsp" },
                { name = "gitmoji" },
            },
        })
    end,
}
