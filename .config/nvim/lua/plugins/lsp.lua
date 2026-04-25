return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "relative",
            },
          },
        },
      },
    },
  },
}
