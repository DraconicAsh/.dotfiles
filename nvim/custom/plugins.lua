local plugins = {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "rust",

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