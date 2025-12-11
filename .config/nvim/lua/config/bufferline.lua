require("bufferline").setup({
  options = {
    -- Set the style to "tabs" to show the tab bar at the top
    mode = "buffers", 
    
    -- Show visible buffers only (not tabs)
    -- This means it will show a list of files, which is what most users want
    diagnostics = "nvim_lsp", -- Show lsp diagnostics (errors/warnings)
    
    -- Customize which buffers appear in the tab line
    indicator = {
      style = "icon",
    },
    
    -- Use a fixed width for the buffer line items
    offsets = {{
        filetype = "NvimTree", 
        text = "File Explorer", 
        text_align = "center"
    }},
    
    -- Disable the close button on the tab bar
    show_buffer_close_icons = false,
    
    -- Disable the close button on the whole tab bar
    show_close_icon = false,
  }
})
