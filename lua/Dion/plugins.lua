local api = vim.api
local fn = vim.fn

-- Root dir to install all plugins
-- Lazy load under opt, while at start time under start sub dir
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

-- Install packer , return true : if packer not linstalled ortherwise return false.

local function packer_ensure_install()
  local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

  if fn.glob(packer_dir) ~= "" then
    return false
  end

  -- Auto Install Packer if not false
  vim.api.nvim_echo({ { "Haven't seen Packer: Installing...." } }, true, {})
  local package_repo = "https://github.com/wbthomason/packer.nvim"
  local install_cmd = string.format("!git clone --depth=1 %s %s", package_repo, packer_dir)
  vim.cmd(install_cmd)
  return true
end


local fresh_install = packer_ensure_install()
vim.cmd("packadd packer.nvim")
local packer = require("packer")
local packer_util = require("packer.util")

-- reload and using PackerSync when ever this plugins file writed (BufWritePost). This ensure every plugins get install

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]



packer.startup { function(use)
  -- My plugins here
  use { "lewis6991/impatient.nvim", config = [[require('impatient')]] } 
  use { "wbthomason/packer.nvim", opt = true } -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "rebelot/kanagawa.nvim" -- kangawa colorscheme

end, config = {
  max_jobs = 16,
  compile_path = packer_util.join_paths(fn.stdpath("data"), "site", "lua", "packer_compiled.lua"),
} }

if fresh_install then
  packer.sync()
end

api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*/nvim/lua/plugins.lua",
  group = api.nvim_create_augroup("packer_auto_compile", { clear = true }),
  callback = function(ctx)
    local cmd = "source " .. ctx.file
    vim.cmd(cmd)
    vim.cmd("PackerCompile")
    vim.notify("PackerCompile done!", vim.log.levels.INFO, { title = "Nvim-config" })
  end,
})

