local opt = vim.opt

-- UI
opt.number = true
opt.signcolumn = "yes:1"
opt.cursorline = true
opt.termguicolors = true
opt.scrolloff = 4

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Behavior
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 500
opt.autoread = true
