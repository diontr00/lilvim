local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		formatting.black.with({ extra_args = { "--fast" } }), --pip3 install
		formatting.stylua, --cargo install
                formatting.golines,   -- go install github.com/segmentio/golines@latest
                formatting.terrafmt,  --install with terraform
		diagnostics.flake8, --pip3 install
                diagnostics.goclangci_lint,  --curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.51.2
                diagnostics.ansiblelint,   --pip3 install 
                diagnostics.terraform_validate,  --install with terraform
                formatting.beautysh -- pip3 install 
                diagnostics.eslint_d.with({
      filetypes={"vue"}
    }),  --npm install , quite good to use with vue
                  
                formatting.prettierd.with({
		filetypes = {
			"javascript","typescript","css","scss","html","json","yaml","markdown","graphql","md","txt",
		}})
	},
})

