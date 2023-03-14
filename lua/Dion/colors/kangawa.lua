-- Setting colors scheme, if not found return some error message 
local default = "kanagawa" 
local status_ok,_ = pcall(vim.cmd, "colorscheme " .. default)
if status_ok then 
  local default_colors = require("kanagawa.colors").setup()

  local my_colors = {
      sumiInk1 = "#07060A", -- Background color 
      fujiWhite = "#ffffff", -- foreground color 
      crystalBlue = "#ffb3c6", -- Functions and tille
      springBlue = "#c9d9ff", -- Special and built ins functions 
      springGreen = "#bff999", -- Strings 
      boatYellow2 = "#a5a58d",  --Operators and regex]
      waveBlue2 = "#d5bdaf", 
      ---------- Some note for future uses -----------
      -- waveBlue1 : visual selection background
      -- sakuraPink : numbers 
       waveRed  = "#f9d1e7" , 
       surimiOrange = "#4cc9f8" ,  
      --constants, imports , booleans  
      oniViolet = "#ade8f4", 
      -- dragonBlue : diagnostic hint 
       fujiGray  = "#BCBDC0", 
      -- waveAqua1 : Diagnostic info 
      -- autumnGreen : Git add
      -- autumnRed : Git Delete
      -- autumnYellow : Git change 
      waveAqua2 =  "#3a86ff", 
      

  }

  require'kanagawa'.setup({ colors = my_colors })
  vim.cmd("colorscheme kanagawa")
else 
  vim.notify("colorscheme " .. default .. " not found !")
  return 
end



