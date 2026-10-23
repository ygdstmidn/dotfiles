return {
    "rmagatti/auto-session",
    priority = 999,
    opts = {
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    },
    config = function(_, opts)
        -- sessionとして保存するオプション
        vim.o.sessionoptions = "buffers,folds,localoptions"
        require("auto-session").setup(opts)
    end,
}
