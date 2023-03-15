-- Require cmp 
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- require luasnip 
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

-- Add extra snippets from a framework 'lookup friendly-snippet snipets/framework for more 
-- require'luasnip'.filetype_extend("python", {"django/*"}
 
-- This one say to enhance performance, idk 
require("luasnip/loaders/from_vscode").lazy_load()


-- When display snippet, press tab to move between spaces, this make the operation better 
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end
-- Some icons 

-- Require nerd font

local kind_icons  = { 
  Method = " [method]", 
  Function = " [function]", 
  Constructor = " [constructor]",
  Field = "  [field]",
  Variable = "  [vars]",
  Class = " [class]",
  Interface = " [interface]",
  Module = " [module]",
  Property = " [property]",
  Unit = " [Unit]",
  Value = " [Value]",
  Enum = " [Enum]",
  Keyword = "[keys]", 
  Snippet = " [Snip]", 
  Color = " ",
  File = " [file]",
  Reference = " [reference]",
  Folder = " [Folder]",
  EnumMember = " [EnumMember]",
  Constant = " [Constant]",
  Struct = " [Struct]",
  Event = "ﳅ [Event]", 
  Operator = " [Operator]", 
  TypeParameter = " [Type]",
  Text  = " [Text]",
}


cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
   mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        luasnip = "",
        buffer = "",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    -- Other extension or sources can be find on npm topic 
    { name = "nvim_lsp" }, -- show snip on lsp first
    { name = "nvim_lua" }, -- then nvim_lua for config
    { name = "luasnip" }, -- then lua snip
    { name = "buffer" }, -- then buffer 
    { name = "path" }, -- then path completion 
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = false, 
    native_menu = false,
  },
}
