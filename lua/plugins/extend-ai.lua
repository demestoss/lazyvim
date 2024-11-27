return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      model = "claude-3.5-sonnet",
      debug = false,
      log_level = "warn",
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = {
      "markdown",
      "norg",
      "rmd",
      "org",
      "copilot-chat",
    },
  },
}
