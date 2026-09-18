return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        palettes = {
          github_dark_default = {
            canvas = {
              default = "#050505",
              inset = "#050505",
            },
          },
        },
      })
      vim.cmd.colorscheme("github_dark_default")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_default",
    },
  },
}
