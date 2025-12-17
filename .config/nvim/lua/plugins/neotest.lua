---@diagnostic disable: missing-fields
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",

      -- Adapters
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          -- JavaScript / TypeScript
          require("neotest-jest")({
            jestCommand = "npx jest",
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),

          -- Python
          require("neotest-python")({
            runner = "pytest",
          }),

          -- Go
          require("neotest-go")({
            args = { "-v" },
          }),
        },
      })
    end,
  },
}
