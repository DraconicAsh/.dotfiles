local plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "rust",

                -- webdev
                "css",
                "html",
                "javascript",

                -- data
                "json",
                "toml",
                "yaml",

                -- git
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",

                -- defaults
                "vim",
                "lua"
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "rust-analyzer",
            },
        },
    }
}
return plugins
