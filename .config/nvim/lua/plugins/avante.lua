---@diagnostic disable: missing-fields
return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "ollama",
      providers = {
        ollama = {
          -- do NOT add "/v1" here
          endpoint = "http://pluto.local:11434",
          model = "qwen2.5:14b-instruct-q4_K_M",
          -- this function enables the provider by checking the local endpoint
          is_env_set = require("avante.providers.ollama").check_endpoint_alive,
        },
      },
    },
  },
}
