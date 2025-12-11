-- ~/.config/nvim/lua/config/nvim-tree.lua

require("nvim-tree").setup({
  -- The options that caused the errors have been removed or moved:
  -- 'view.auto_resize' is now simply 'view.float.enable' or not needed for basic setup.
  
  view = {
    -- Setting a width is sometimes needed for proper resizing
    width = 30,
  },
  
  -- The 'update_focused_file' section is correct
  update_focused_file = {
    enable = true,
  },
  
  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules" },
  },
  
  renderer = {
    -- 'renderer.icons.show_only_dir_contents' is now 'icons.show.file'
    icons = {
      show = {
        file = true, -- Show file icons
        folder = true, -- Show folder icons
      },
    },
  },
})
