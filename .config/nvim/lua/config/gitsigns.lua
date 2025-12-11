-- ~/.config/nvim/lua/config/gitsigns.lua

require('gitsigns').setup({
  signs = {
    add = { text = '▎' },  -- Added lines
    change = { text = '▎' }, -- Modified lines
    delete = { text = '契' }, -- Deleted lines
    topdelete = { text = '‾' },
    changedelete = { text = '契' },
  },
  on_attach = function(bufnr)
    local gs = require('gitsigns')

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Keymaps for navigating Git changes
    map('n', ']c', function() gs.next_hunk() end, 'Next Git Hunk')
    map('n', '[c', function() gs.prev_hunk() end, 'Previous Git Hunk')

    -- Keymaps for staging/resetting hunks
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
    map('n', '<leader>hb', function() gs.blame_line{full=true} end, 'Blame Line')
  end,
})
