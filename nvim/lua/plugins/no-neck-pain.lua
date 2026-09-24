return {
    "shortcuts/no-neck-pain.nvim",
    event = "BufReadPre",
    keys = {
        { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" },
        { "<leader>z", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain(zen mode)" },
    },
    config = function()
        require("no-neck-pain").setup()
        vim.cmd("NoNeckPain") -- バッファ開いた直後に NoNeckPain を有効化する

        -- https://zenn.dev/vim_jp/articles/ff6cd224fab0c7
        -- vimを終了する際，特殊ウィンドウを閉じる
        -- これを行わない場合，auto-sessionで謎の空バッファができてしまう
        vim.api.nvim_create_autocmd("QuitPre", {
            callback = function()
                -- 現在のウィンドウ番号を取得
                local current_win = vim.api.nvim_get_current_win()
                -- すべてのウィンドウをループして調べる
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    -- カレント以外を調査
                    if win ~= current_win then
                        local buf = vim.api.nvim_win_get_buf(win)
                        -- buftypeが空文字（通常のバッファ）があればループ終了
                        if vim.bo[buf].buftype == "" then
                            return
                        end
                    end
                end
                -- ここまで来たらカレント以外がすべて特殊ウィンドウということなので
                -- カレント以外をすべて閉じる
                vim.cmd.only({ bang = true })
                -- この後、ウィンドウ1つの状態でquitが実行されるので、Vimが終了する
            end,
            desc = "Close all special buffers and quit Neovim",
        })
    end,
    opts = {},
}
