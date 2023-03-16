
local cmd = vim.cmd

cmd [[
  au BufNewFile,BufRead *.handlebars set filetype=html
  au BufWritePre * if exists(":Format") | :execute("Format") | endif
  au FileType  json syntax match Comment +\/\/.\+$+
  au BufNewFile , BufRead,BufEnter *.tf* set filetype=terraform
]]




