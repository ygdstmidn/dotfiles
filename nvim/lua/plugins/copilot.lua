return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "InsertEnter", "VeryLazy" },

    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<M-l>",
                    next = "<M-j>",
                    prev = "<M-k>",
                    dismiss = "<Esc>",
                },
            },
        })
    end,
}
