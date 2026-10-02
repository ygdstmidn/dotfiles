local function switch_header_source()
    local file = vim.api.nvim_buf_get_name(0)

    local ext = vim.fn.fnamemodify(file, ":e")
    local stem = vim.fn.fnamemodify(file, ":t:r")

    local targets

    if ext == "c" or ext == "cpp" then
        targets = { stem .. ".h", stem .. ".hpp" }
    elseif ext == "h" or ext == "hpp" then
        targets = { stem .. ".c", stem .. ".cpp" }
    else
        print("Not a C/C++ source or header file")
        return
    end

    local root = vim.fs.root(0, ".git")
    if not root then
        root = vim.uv.cwd()
    end
    local dir = vim.fs.dirname(file)
    local home = os.getenv("HOME")

    while dir do
        local found = vim.fs.find(targets, {
            path = dir,
            limit = math.huge,
        })

        if #found == 1 then
            vim.cmd.edit(found[1])
            return
        elseif #found > 1 then
            vim.ui.select(found, {
                prompt = "Select matching file:",
                format_item = function(item)
                    return vim.fn.fnamemodify(item, ":.")
                end,
            }, function(choice)
                if choice then
                    vim.cmd.edit(choice)
                end
            end)
            return
        end

        if dir == root then
            break
        end

        if dir == home then
            break
        end

        local parent = vim.fs.dirname(dir)

        if parent == dir then
            break
        end

        dir = parent
    end

    vim.notify("No matching file found")
end

vim.keymap.set(
    "n",
    "<M-o>",
    switch_header_source,
    { desc = "Switch between header and source file" }
)
vim.keymap.set(
    "n",
    "<leader>o",
    switch_header_source,
    { desc = "Switch between header and source file" }
)
