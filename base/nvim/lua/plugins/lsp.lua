return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {
          cmd_env = {
            NODE_OPTIONS = "--max-old-space-size=1024",
          },
          init_options = {
            preferences = {
              includePackageJsonAutoImports = "off",
            },
          },
        },
      },
    },
  },
}
