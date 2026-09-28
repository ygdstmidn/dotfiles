return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- optional but recommended
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    event = "VeryLazy",
    keys = {
        { mode = "n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", {} },
        { mode = "n", "<Leader>fc", "<cmd>Telescope command_history<CR>", {} },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                "^.git/",
                "/.git",
            },
        },
        pickers = {
            find_files = {
                hidden = true,
            },
        },
    },
}
