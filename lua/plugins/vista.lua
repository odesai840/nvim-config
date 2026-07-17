return {
    "liuchengxu/vista.vim",
    init = function()
        vim.cmd([[
        let g:vista#renderer#icons = {
              \ 'member': '',
              \ }
        " Do not echo message on command line
        let g:vista_echo_cursor = 0
        " Stay in current window when vista window is opened
        let g:vista_stay_on_open = 0

        nnoremap <silent> <Space>t :<C-U>Vista!!<CR>
      ]])
    end,
    cmd = "Vista",
}
