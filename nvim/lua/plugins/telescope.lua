return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- optional but recommended
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { mode = "n", "<Leader>ff", "<cmd>Telescope find_files<CR>", {} },
        { mode = "n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", {} },
        { mode = "n", "<Leader>fb", "<cmd>Telescope buffers<CR>", {} },
        { mode = "n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", {} },
        { mode = "n", "<Leader>fc", "<cmd>Telescope commands<CR>", {} },
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
