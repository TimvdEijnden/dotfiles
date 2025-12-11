require("catppuccin").setup({
    -- Configure the theme flavor
    flavour = "mocha", -- Options: mocha, macchiato, frappe, latte
    
    -- Recommended: Enable transparent background
    transparent_background = false, 
    
    -- Integrate with the plugins you have installed
    integrations = {
        bufferline = true, -- Integrates with bufferline.nvim
        nvimtree = true,   -- Integrates with nvim-tree.lua
        telescope = true,  -- Integrates with telescope.nvim
        -- Set this to true if you install Treesitter later!
        treesitter = false, 
    },
})

-- Load the colorscheme immediately after setup
vim.cmd.colorscheme "catppuccin"
