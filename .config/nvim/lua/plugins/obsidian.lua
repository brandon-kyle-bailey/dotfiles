return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- make sure this is included
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/second-brain",
      },
    },
    templates = {
      folder = "_templates",
      date_format = "%Y %b %a %d",
      time_format = "%H:%M",
    },
    daily_notes = {
      folder = "notes/dailies",
      date_format = "%Y %b %a %d",
    },

    picker = {
      name = "telescope.nvim",
    },
  },
  init = function()
    local cwd = vim.fn.getcwd()
    local vault_path = vim.fn.expand("~/second-brain")

    if vim.fn.argc() == 0 and cwd ~= vault_path then
      vim.cmd("cd " .. vault_path)
    end

    -- Optionally: force load obsidian.vim if inside vault
    if cwd:find("second%-brain") then
      vim.cmd("runtime plugin/obsidian.vim")
    end
  end,
}
