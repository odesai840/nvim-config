return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup {
            start_in_insert = true,
        }

        local function toggle_terminal()
            local term = require("toggleterm.terminal").get(1)
            if term and term:is_open() then
                local pid = vim.fn.jobpid(term.job_id)
                local handle = io.popen("pgrep -P " .. pid)
                local children = handle and handle:read("*a") or ""
                if handle then
                    handle:close()
                end
                if children ~= "" then
                    local choice = vim.fn.confirm("A process is running in the terminal. Kill it and close?", "&Yes\n&No",
                        2)
                    if choice ~= 1 then
                        return
                    end
                    for child_pid in children:gmatch("%d+") do
                        vim.fn.system("kill " .. child_pid)
                    end
                end
            end
            vim.cmd("ToggleTerm")
            vim.schedule(function()
                term = require("toggleterm.terminal").get(1)
                if term and term:is_open() then
                    vim.cmd("startinsert")
                end
            end)
        end

        vim.keymap.set({ "n", "i", "t" }, "<A-t>", toggle_terminal)

        vim.api.nvim_create_autocmd("TermOpen", {
            callback = function()
                vim.wo.winhighlight = "Normal:TerminalNormal"
            end,
        })
    end,
}
