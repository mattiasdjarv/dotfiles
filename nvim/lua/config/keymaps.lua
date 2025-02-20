-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--- C++ keymaps ---
local Util = require("lazyvim.util")
local map = Util.safe_keymap_set
map(
  "n",
  "<leader>rr",
  ":w | :TermExec cmd='g++ % -o %< && ./%<' size=50 direction=tab go_back=0<CR>",
  { desc = "Compile and Run C++ File" }
)
map(
  "n",
  "<leader>rd",
  ":w | :TermExec cmd='g++ % -o %< && gdb ./%<' size=50 direction=tab go_back=0<CR>",
  { desc = "Compile and Run C++ File with Debug" }
)
