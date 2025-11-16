
local trig = s("trig", t("loaded!!"))
local trigger = s("trigger", {
	t({"After jumping forward once, cursor is here ->"}), i(2),
	t({"", "After expanding, the cursor is here ->"}), i(1),
	t({"", "After jumping once more, the snippet is exited there ->"}), i(0),
})

-- Double up the { and } to escape them
-- 'fmt' already returns a table of nodes, no need to wrap in {}
local java = s("java", fmt([[
if(Java.available){{
   Java.perform(
        () => {{
            {}
        }}
    )
}}
]], { i(0) })
)

local java_use = s("use", fmt([[ Java.use("{}");]], {i(0)}))

local implementation = s("implement", fmt([[
implementation = function({}) {{
    {}
}}
]], {i(1), i(0)} )) -- Jump index 0 is the last jump
return { trig, trigger, java, java_use, implementation }
