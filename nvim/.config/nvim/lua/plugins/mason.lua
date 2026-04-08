return {
  "mason-org/mason-lspconfig.nvim",
    opts = {
      -- lists of servers for mason to install
      ensure_installed = {
        "clangd",
        "pyright",
        "lua_ls",
        "bashls",
        "ts_ls",
      },
    },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          }
        }
      }
    },
    "neovim/nvim-lspconfig",
  }
}

