return {
  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      opts.animate = opts.animate or {}
      opts.animate.enabled = false

      opts.left = {
        { title = "Neotest Summary", ft = "neotest-summary" },
      }
      opts.right = opts.right or {}
      table.insert(opts.right, {
        ft = "copilot-chat",
        title = "Copilot Chat",
        size = { width = 70 },
      })
    end,
  },
}
