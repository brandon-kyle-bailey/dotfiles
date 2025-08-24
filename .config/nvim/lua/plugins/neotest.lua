return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        -- runner = "pytest",
        args = { "--no-migrations" },
      },
      ["neotest-jest"] = {
        jestCommand = "npx jest",
        jestConfigFile = function(file)
          if string.find(file, "/packages/") then
            return string.match(file, "(.-/[^/]+/)src") .. "unit.jest.config.ts"
          end

          return vim.fn.getcwd() .. "/unit.jest.config.ts"
        end,
        env = { CI = true },
      },
    },
  },
}
