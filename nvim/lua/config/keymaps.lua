print("DEBUG: keymaps file loaded")
-- Your existing code
local map = vim.keymap.set
map("i", "jj", "<esc>l", { desc = "like using <esc>" })
map("n", "<leader>ti", "$a # type: ignore<Esc>", { desc = "Add type: ignore" })
