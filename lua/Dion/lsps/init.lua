-- Set up LSP 
-- tell nvim to use specific lsp 

local stastus_ok, _ = pcall(require, "lspconfig")
if not stastus_ok then 
  vim.notify("Error when require native lsp support by nvim",{},{}) 
  return 
end


require "Dion.lsps.mason" --Mason used to install and manage lsp server
require ("Dion.lsps.handlers").setup() 
require "Dion.lsps.null-ls" -- Use to hook LSP features : such as hovering, ... 


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


