local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "rust_analyzer"}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

require'lspconfig'.rust_analyzer.setup{
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
            check = {
                command = "clippy",
            },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
        }
    }
}
