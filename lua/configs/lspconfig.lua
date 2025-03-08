local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
-- local clangd_path = vim.fn.stdpath("data") .. "/mason/bin/clangd"
local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "clangd",
    "pyright",
}

-- list of servers configured with default config.
local default_servers = { "pyright" }

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

lspconfig.clangd.setup({
    cmd = {
        -- "clangd",
        vim.fn.stdpath("data") .. "/mason/bin/clangd", --use mason installed clangd
        "--background-index",
        --     "--clang-tidy",
        -- "--compile-commands-dir=/home/adogra/mujoco_ws",
        --     "--compile_args_from=filesystem",
        --     "--fallback-style=none",
        "--query-driver=/usr/bin/c++,/usr/bin/g++",
        "--log=verbose",
        --     "--header-insertion=never",
        --     "--pch-storage=memory",
        --     "--limit-results=500",
    },
    root_dir = function(fname)
        return lspconfig.util.root_pattern("compile_commands.json", ".git")(fname)
            or lspconfig.util.find_git_ancestor(fname)
            or lspconfig.util.path.dirname(fname)
    end,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.pyright.setup({
    -- cmd = { "pyright-langserver", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            pythonPath = "/usr/bin/python3",
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    -- "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
