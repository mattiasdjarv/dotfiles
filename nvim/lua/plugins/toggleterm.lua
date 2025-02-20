return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "float", -- Options: "horizontal", "vertical", "float"
      open_mapping = "<C-\\>", -- Fix the incorrect mapping
      close_on_exit = true, -- Auto-close terminal when the process exits
      shell = vim.o.shell, -- Use default shell
    })

    -- Additional keymaps
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]], { desc = "Close terminal" })
  end,
}
