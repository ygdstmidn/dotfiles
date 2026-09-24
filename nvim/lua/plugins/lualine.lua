return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = {
                    {
                        -- encoding: エンコーディングがUTF-8の場合は表示しない。
                        function()
                            return (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
                        end,
                    },
                    {
                        -- fileformat: &ffがunixの場合は表示しない。
                        function()
                            return vim.bo.fileformat:gsub("^unix$", "")
                        end,
                    },
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
