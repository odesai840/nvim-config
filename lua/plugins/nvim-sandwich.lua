return {
    "machakann/vim-sandwich",
    init = function()
        vim.cmd([[
        " Map s to nop since s in used by vim-sandwich. Use cl instead of s.
        nmap s <Nop>
        omap s <Nop>
      ]])
    end,
    event = "VeryLazy",
}
