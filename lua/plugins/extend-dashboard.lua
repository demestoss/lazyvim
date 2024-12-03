return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
  ██▀███  ▓█████ ▓█████▄  ██▀███   █    ██  ███▄ ▄███▓ 
 ▓██ ▒ ██▒▓█   ▀ ▒██▀ ██▌▓██ ▒ ██▒ ██  ▓██▒▓██▒▀█▀ ██▒ 
 ▓██ ░▄█ ▒▒███   ░██   █▌▓██ ░▄█ ▒▓██  ▒██░▓██    ▓██░ 
 ▒██▀▀█▄  ▒▓█  ▄ ░▓█▄   ▌▒██▀▀█▄  ▓▓█  ░██░▒██    ▒██  
 ░██▓ ▒██▒░▒████▒░▒████▓ ░██▓ ▒██▒▒▒█████▓ ▒██▒   ░██▒ 
 ░ ▒▓ ░▒▓░░░ ▒░ ░ ▒▒▓  ▒ ░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ ░ ▒░   ░  ░ 
   ░▒ ░ ▒░ ░ ░  ░ ░ ▒  ▒   ░▒ ░ ▒░░░▒░ ░ ░ ░  ░      ░ 
   ░░   ░    ░    ░ ░  ░   ░░   ░  ░░░ ░ ░ ░      ░    
    ░        ░  ░   ░       ░        ░            ░    
 ]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          {
            pane = 2,
            icon = " ",
            desc = "Browse Repo",
            padding = 1,
            key = "b",
            action = function()
              Snacks.gitbrowse()
            end,
          },
          {
            pane = 2,
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            cwd = true,
            -- indent = 2,
            padding = 1,
          },
          function()
            local in_git = Snacks.git.get_root() ~= nil
            local cmds = {
              {
                title = "Notifications",
                cmd = "gh notify -s -a -n5",
                action = function()
                  vim.ui.open("https://github.com/notifications")
                end,
                key = "n",
                icon = " ",
                height = 5,
              },
              -- {
              --   title = "Open Issues",
              --   cmd = "gh issue list -L 3",
              --   key = "i",
              --   action = function()
              --     vim.fn.jobstart("gh issue list --web", { detach = true })
              --   end,
              --   icon = " ",
              --   height = 7,
              -- },
              {
                icon = " ",
                title = "Open PRs",
                cmd = "gh pr list -L 3",
                key = "p",
                action = function()
                  vim.fn.jobstart("gh pr list --web", { detach = true })
                end,
                height = 7,
              },
              {
                icon = " ",
                title = "Git Status",
                cmd = "hub status --short --branch --renames",
                height = 5,
                ttl = 60,
              },
            }
            return vim.tbl_map(function(cmd)
              return vim.tbl_extend("force", {
                pane = 2,
                section = "terminal",
                enabled = in_git,
                padding = 1,
                ttl = 60,
                -- indent = 3,
              }, cmd)
            end, cmds)
          end,
          { section = "startup" },
        },
      },
    },
  },
}
