require("core.packer")
require("core.keymaps")
require("core.options")
require("core.plugin_config")

vim.api.nvim_create_user_command("ToggleNumber", function()
  vim.opt.number = not vim.opt.number:get()
end, { desc = "Toggle line numbers on and off" })
