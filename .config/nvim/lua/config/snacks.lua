-- ~/.config/nvim/lua/config/snacks.lua

-- Initialize the plugin and ensure UI select is enabled
require("snacks").setup({
    ui = {
        select = true,
    },
    explorer = {
	hidden = true,
	replace_netrw = true,
    },
    picker = {
	hidden = true,
    },	
})


-- 2. Define Keymaps AFTER the editor is fully loaded
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local Snacks = require("snacks")
		local picker = require("snacks.picker")
		local explorer = require("snacks.explorer")
		-- Helper function to define keymaps safely
		local function map(command, func)
			vim.keymap.set('n', '<leader>' .. command, function()
				-- Check if the function exists before calling, providing a clean error if it fails
				if picker[func] then
					picker[func]()
				else
					vim.notify(
						"Snacks function '" .. func .. "' failed to initialize. Check :checkhealth snacks.",
						vim.log.levels.ERROR
					)
				end
			end, { desc = '[Snacks] ' .. func:gsub('_', ' ') })
		end

		local function log(msg)
			local f = io.open("/tmp/snacks_explorer.log", "a")
			if f then
				f:write(os.date("%H:%M:%S") .. " | " .. msg .. "\n")
				f:close()
			end
		end

		local function toggle_explorer()
			local picker = require("snacks").picker
			if Snacks.picker.get({ source = "explorer" })[1] == nil then
				Snacks.picker.explorer()
			elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == true then
				Snacks.picker.explorer()
			elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == false then
				Snacks.picker.get({ source = "explorer" })[1]:focus()
			end
		end

		-- Map the external tool-dependent functions
		map('ff', 'files')
		map('fg', 'git_files')
		map('fb', 'buffers')
		vim.keymap.set('n', '<leader>e', picker.explorer, { desc = '[Snacks] Toggle Explorer' })
		vim.keymap.set('n', '<leader>t', toggle_explorer, { desc = '[Snacks] Focus Explorer' })
		vim.keymap.set('n', '<leader>/', picker.grep, { desc = '[Snacks] Live Grep' })
	end,
})
