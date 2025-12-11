-- ~/.config/nvim/lua/config/cmp.lua

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind') -- Require lspkind here

cmp.setup({
    -- ... (sources and mapping sections remain the same)
    
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    completion = {
        keyword_length = 1, 
        -- This tells nvim-cmp to check for suggestions after 1 character
    },
    
    -- Formatting section (CRITICAL FIX)
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        
        -- Use the lspkind formatter directly here
        format = lspkind.cmp_format({
            -- Optional settings for lspkind icons:
            mode = 'symbol_text', -- show only symbol and text
            maxwidth = 50, -- max width of the menu item
            ellipsis_char = '...', -- characters to show for truncation
        }),
    },
})
