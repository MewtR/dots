local ls = require("luasnip")

-- logging issues. See :h luasnip-logging
-- Run :lua require("luasnip").log.open()
-- ls.log.set_loglevel("debug")


-- directory relative to $VIMRC
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/luasnippets"})

-- Not sure what the point of this is. Should use :LuaSnipListAvailable to see available snippets
-- local sl = require("luasnip.extras.snippet_list")
-- sl.open()

local fmt = require("luasnip.extras.fmt").fmt
-- Jump index 0 is the last jump
local i = ls.insert_node

-- mappings
--[[
vim.keymap.set({"i", "s"}, "<C-j>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-k>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-n>", function()
	if ls.choice_active() then
        require("luasnip.extras.select_choice")()
        return nil
	end
end, {silent = true})
--]]
