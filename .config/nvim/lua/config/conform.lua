-- ~/.config/nvim/lua/config/conform.lua

require("conform").setup({
    -- Configuration for specific filetypes
    formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        vue = { "prettier" }, -- Add Vue support if needed
        -- Add other languages here (e.g., lua = { "stylua" })
    },

    -- Ensure automatic formatting is DISABLED as requested
    format_on_save = nil,
    
    -- Optional: If you want better error messages
    log_level = vim.log.levels.ERROR, 
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
    -- This function calls conform to format the buffer (the entire file)
    require("conform").format({
        async = true,
        -- fallback to LSP formatting if conform has no tools configured for the filetype
        lsp_fallback = true, 
    })
end, { desc = "[F]ormat file (conform)" })
