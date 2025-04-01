return {
  -- Enable Pyright LSP for Python
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {}, -- Python LSP
      },
    },
  },

  -- Enable automatic formatting with Black
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
      },
    },
  },

  -- Ensure Treesitter support for Python
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python" },
    },
  },
}
