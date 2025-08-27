return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        -- runner = "pytest",
        args = { "--no-migrations" }, -- requires pytest-django
      },
      ["neotest-jest"] = {
        jestCommand = "npx jest",
        jestConfigFile = function(file)
          if string.find(file, "/packages/") then
            local base = string.match(file, "(.-/[^/]+/)src")
            if base then
              return base .. "unit.jest.config.ts"
            end
          end
          return vim.fn.getcwd() .. "/unit.jest.config.ts"
        end,
        env = { CI = "true" }, -- strings, not booleans
      },
    },
  },
}
