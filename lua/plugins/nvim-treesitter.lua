return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "bash", "c", "cpp", "c_sharp", "dart", "glsl", "groovy",
            "html", "css", "json", "lua", "markdown", "markdown_inline",
            "python", "rust", "slang", "svelte", "typescript", "tsx", "zig",
        })

        vim.treesitter.language.register("slang", "shaderslang")

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "sh", "c", "cpp", "cs", "dart", "glsl", "groovy",
                "html", "css", "json", "lua", "markdown",
                "python", "rust", "shaderslang", "svelte",
                "typescript", "typescriptreact", "zig",
            },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
