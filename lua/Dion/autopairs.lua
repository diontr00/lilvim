local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end
-- Mostly the default plugins
-- This replace the lexima vim, which lack of feature and not integrate well with cmp-vim and tree sitter
npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  -- disable_filetype
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    -- map the Control-e when in inserting mode, to display where to end the pair 
    map = "<C-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey= "LineNr",
  },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
