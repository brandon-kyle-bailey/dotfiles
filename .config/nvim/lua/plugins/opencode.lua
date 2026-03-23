return {
  {
    "sudo-tee/opencode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("opencode").setup({})
    end,
  },
}
