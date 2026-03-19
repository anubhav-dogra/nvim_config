local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        -- c_cpp = {"clang-format"},
        cpp = { "clang-format" },
        c = { "clang-format" },
        python = { "ruff_fix", "ruff_format" },
        yaml = { "prettier" },
        xml = { "prettier" },
        xacro = { "prettier" },
        urdf = { "prettier" },
        srdf = { "prettier" },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    formatters = {
        -- C & C++
        ["clang-format"] = {
            prepend_args = {
                "-style=file",
            },
        },
        -- -- Golang
        -- ["goimports-reviser"] = {
        --     prepend_args = { "-rm-unused" },
        -- },
        -- golines = {
        --     prepend_args = { "--max-len=80" },
        -- },
        -- -- Lua
        -- stylua = {
        --     prepend_args = {
        --         "--column-width", "80",
        --         "--line-endings", "Unix",
        --         "--indent-type", "Spaces",
        --         "--indent-width", "4",
        --         "--quote-style", "AutoPreferDouble",
        --     },
        -- },
        -- Python formatting/linting is handled by Ruff to match repo pre-commit.
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}
require("conform").setup(options)
-- return options
