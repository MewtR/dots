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
