--https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlnavigator
local server = {
  "pyright",
  "jsonls",
  "yamlls",
  "bashls",
  "marksman",
  "tsserver",
  "cssls",
  "html",
  "terraformls", 
  "vuels", 
  "volar", 
  "jsonls", 
  "golines", 
  "terrafmt", 
  "flake8", 
  "goclangcli_lint", 
  "ansible_lint", 
  "terraform_validate", 
  "beautysh", 
  "prettierd", 
  "eslint_d", 
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "",
    },
  },
  local_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = server,
  automatic_installation = true,
})


local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("There is something wrong with lspconfig")
  return
end

local opts = {}

for _, server in pairs(server) do
  opts = {
    on_attach    = require("Dion.lsps.handlers").on_attach, -- This will get start anytime the buffer attach to the lsp
    capabilities = require("Dion.lsps.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "Dion.lsps.settings." .. server) -- Setting specific to a language
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

require 'lspconfig'.flow.setup {}

