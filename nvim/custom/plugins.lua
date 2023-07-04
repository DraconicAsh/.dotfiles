local plugins = {
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
        }
    }
}
return plugins
