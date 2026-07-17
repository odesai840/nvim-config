return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-omni",
        "hrsh7th/cmp-cmdline",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "SirVer/ultisnips",
        "echasnovski/mini.icons",
        "xzbdmw/colorful-menu.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local MiniIcons = require("mini.icons")
        local colorful_menu = require("colorful-menu")

        cmp.setup {
            snippet = {
                expand = function(args)
                    vim.fn["UltiSnips#Anon"](args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ["<Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                ["<S-Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
                ["<CR>"] = cmp.mapping.confirm { select = true },
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Esc>"] = cmp.mapping.close(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "ultisnips" },
                { name = "path" },
                { name = "buffer",   keyword_length = 2 },
            },
            completion = {
                keyword_length = 1,
                completeopt = "menu,noselect",
            },
            view = {
                entries = "custom",
            },
            formatting = {
                format = function(entry, vim_item)
                    local icon, hl = MiniIcons.get("lsp", vim_item.kind)
                    vim_item.kind = icon .. " " .. vim_item.kind
                    vim_item.kind_hl_group = hl

                    local highlights_info = colorful_menu.cmp_highlights(entry)
                    if highlights_info ~= nil then
                        vim_item.abbr_hl_group = highlights_info.highlights
                        vim_item.abbr = highlights_info.text
                    end

                    return vim_item
                end,
            },
        }

        cmp.setup.filetype("tex", {
            sources = {
                { name = "omni" },
                { name = "ultisnips" },
                { name = "buffer",   keyword_length = 2 },
                { name = "path" },
            },
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })

        vim.cmd([[
        highlight! link CmpItemMenu Comment
        highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
        highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
        highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
        highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
        highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
        highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
      ]])
    end,
}
