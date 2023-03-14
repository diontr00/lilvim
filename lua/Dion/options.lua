-- This file is used to set some default options 

local vim_options = { 
    -- Set backup when file is writing, but not keeping backup around 
    backup = false, 
    hlsearch = false, 
    incsearch = true, 

    --This allow to access the system clipboard
    clipboard = "unnamedplus",

    --Increase the space in command line 
    cmdheight = 2,
    --Pop up match menu not automatically select match result  
    completeopt = { "menuone" , "noselect" },
    
    --Setting conceal level 
    conceallevel= 0,

    -- Setting file encoding to utf-8 
    fileencoding = "utf-8",
    emoji = true, 

    -- Search highlight 
    hlsearch= true,

    -- Ignorecase in search 
    ignorecase= true,

    -- Allow mouse to be used 
    mouse = "a", 

    -- pop up menu height 
    pumheight = 10, 

    -- turn off current mode text
    showmode = false, 

    -- Alway show tab 
    showtabline = 2, 

    -- override ignorecase if the search pattern contain uppercase character 
    smartcase = true, 

    -- adapting indent 
    smartindent = true, 

    -- Force to split below the current window (Horizontal)
    splitbelow = true, 

    --Force to split on the right of the current window (vertical) 
    splitright = true, 

    -- File a bit useless, especially when having the backup file on write 
    swapfile = false, 
   
    -- Just to noramilize the default of nvim 
    timeoutlen = 1000,

    -- Persistent undo 
    undofile  = true, 

    -- Make the completion faster
    updatetime  = 300, 

    -- If the file is currently written by some other program , the file is not allowed to be edited 
    writebackup = false, 

    -- converts= tab to spaces 
    expandtab = true, 

    -- Set the numbers of space insert 
    shiftwidth = 2, 

    -- Highlight the current line 
    cursorline = true,

    -- set number 
    number = true, 

    -- Disable relative numbered lines 
    relativenumber = false, 

    -- Set number width to 3 
    numberwidth = 3,

    -- Always show the sign columns 
    signcolumn = "yes", 

    -- Enable wrap line 
    wrap = true, 
    -- Auto scroll, keep 9 line below the current cursor
    scrolloff = 10, 

    -- Set term gui colors
    termguicolors = true 
}

for k, v in pairs(vim_options) do 
    vim.opt[k] = v
end 

vim.opt.iskeyword:append("-")
vim.cmd "set whichwrap+=<,>,[,],h,l"

