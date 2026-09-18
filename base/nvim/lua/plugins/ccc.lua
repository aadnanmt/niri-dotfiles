return {
  {
    "uga-rosa/ccc.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ccc").setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
  },
}
