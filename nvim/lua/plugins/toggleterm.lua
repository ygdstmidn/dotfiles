return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    event = "VeryLazy",
    keys = {
        { "<M-C-b>" },
        { "<M-C-u>" },
        { "<C-j>" },
        { "<leader>gg" },
    },

    config = function()
        require("toggleterm").setup({
            on_create = function(term)
                if vim.fn.filereadable("platformio.ini") == 1 then
                    term:send("source ~/.platformio/penv/bin/activate")
                    vim.schedule(function()
                        term:send("clear")
                    end)
                end
            end,
        })

        local Terminal = require("toggleterm.terminal").Terminal

        local pio_build = Terminal:new({
            cmd = "~/.platformio/penv/bin/pio run",
            display_name = "PlatformIO Build",
            direction = "horizontal",
            close_on_exit = false,
        })
        local pio_upload = Terminal:new({
            cmd = "~/.platformio/penv/bin/pio run -t upload",
            display_name = "PlatformIO Upload",
            direction = "horizontal",
            close_on_exit = false,
        })

        vim.keymap.set("n", "<M-C-b>", function()
            vim.api.nvim_command("wall")
            pio_build:toggle()
        end, {})
        vim.keymap.set("n", "<M-C-u>", function()
            vim.api.nvim_command("wall")
            pio_upload:toggle()
        end, {})

        vim.keymap.set("n", "<C-j>", "<cmd>ToggleTerm<CR>", {})
        vim.keymap.set("t", "<C-j>", "<cmd>ToggleTerm<CR>", {})
        vim.keymap.set("n", "<M-C-j>", [[<C-\><C-n>]], {})
        vim.keymap.set("t", "<M-C-j>", [[<C-\><C-n>]], {})

        vim.keymap.set("n", "<leader>gg", function()
            vim.api.nvim_command("wall")
            local root = vim.fs.root(0, { ".git" })
            if not root then
                vim.notify("Not in a git repository")
                return
            end

            Terminal:new({
                cmd = "lazygit -p " .. vim.fn.shellescape(root),
                hidden = true,
                direction = "float",
                float_opts = { border = "curved", width = 999, height = 999 },
            }):toggle()
        end, {})
    end,
}
