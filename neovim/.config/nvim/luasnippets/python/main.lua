local main = s("main", fmt([[
if __name__ == '__main__':
    {}
]], {i(0)}
    )
)

local def = s("def", fmt([[
def {}({}) -> {}:
    {}
]], {i(1), i(2), i(3, "None"), i(0)})
)

return {main, def}
