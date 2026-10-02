return {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "kkharji/sqlite.lua",
        -- Only required if using match_algorithm fzf
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    event = "VeryLazy",
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope").extensions.smart_open.smart_open({
                    cwd_only = true,
                    filename_first = false,
                })
            end,
            desc = "Smart Open",
        },
        {
            "<leader>FF",
            function()
                require("telescope").extensions.smart_open.smart_open({
                    cwd_only = false, -- PC全体から検索
                    filename_first = true, -- ファイル名を先頭に(PATHが長く，見づらいので)
                })
            end,
            desc = "Smart Open(from all of PC)",
        },
    },
    config = function()
        require("telescope").load_extension("smart_open")
    end,
}
