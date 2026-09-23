-- ヤンクでクリップボードにコピー
vim.opt.clipboard:append({
    "unnamed",
    "unnamedplus",
})
-- 行をまたいで移動
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"
-- コマンドラインの履歴を10000件保存する
vim.opt.history = 10000
-- vim の矩形選択で文字が無くても右へ進める
vim.opt.virtualedit = "block"
-- 挿入モードでバックスペースで削除できるようにする
vim.opt.backspace = {
    "indent",
    "eol",
    "start",
}
-- wildmenu tabで補完するとき，候補一覧が出る
vim.opt.wildmenu = true

-- --------------------------------------
-- 検索
-- --------------------------------------
-- 検索するときに大文字小文字を区別しない
vim.opt.ignorecase = true
-- 大文字で検索すれば，大きさが考慮される(小文字で検索すると大文字と小文字を無視して検索)
vim.opt.smartcase = true
-- インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
vim.opt.incsearch = true
-- 検索結果をハイライト表示
vim.opt.hlsearch = true
-- Escの2回押しでハイライト消去
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")

-- --------------------------------------
-- 表示設定
-- --------------------------------------
-- 長い行も省略されずに表示
vim.opt.display = "lastline"
-- 長い行を折り返さない
vim.opt.wrap = false
-- 対応する括弧やブレースを表示
-- vim.opt.showmatch = true
-- vim.opt.matchtime = 1
-- 不可視文字を表示
vim.opt.list = true
-- 行末のスペースを可視化
vim.opt.listchars = {
    tab = "^ ",
    trail = "~",
}
-- 行番号の表示
vim.opt.number = true
--メッセージ表示欄を2行確保
-- vim.opt.cmdheight = 2

-- --------------------------------------
-- インデント設定
-- --------------------------------------
-- 入力モードでTabキー押下時に半角スペースを挿入(4つ)
vim.opt.expandtab = true
vim.opt.softtabstop = 4
-- ファイル内にあるタブ文字の表示幅
vim.opt.tabstop = 4
-- インデント幅，自動いろいろ
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- リーダーキー
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- import plugins
        { import = "plugins" },
    },
    -- automatically check for plugin updates
    checker = {
        enabled = true,
    },
})
