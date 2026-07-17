return {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gwrite", "Gread" },
    keys = {
        { "<leader>gs",  "<cmd>Git<cr>",                    desc = "Git: show status" },
        { "<leader>ga",  "<cmd>Gwrite<cr>",                 desc = "Git: add file" },
        { "<leader>gc",  "<cmd>Git commit<cr>",             desc = "Git: commit changes" },
        { "<leader>gpl", "<cmd>Git pull<cr>",               desc = "Git: pull changes" },
        { "<leader>gpu", "<cmd>15 split|term git push<cr>", desc = "Git: push changes" },
        { "<leader>gb",  ":Git blame<cr>",                  mode = "v", desc = "Git: blame selected line" },
        { "<leader>gf",  ":Git fetch ",                     desc = "Git: fetch" },
        { "<leader>gbd", ":Git branch -D ",                 desc = "Git: delete branch" },
        { "<leader>gbn",
            function()
                vim.ui.input({ prompt = "Enter a new branch name" }, function(user_input)
                    if user_input == nil or user_input == "" then
                        return
                    end
                    vim.cmd(string.format("G checkout -b %s", user_input))
                end)
            end,
            desc = "Git: create new branch",
        },
    },
    config = function()
        vim.cmd([[cnoreabbrev git Git]])
    end,
}
