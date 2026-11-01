local vector = ms({"vec0", "(0"}, fmt([[({}.0, {}.0, {}.0){}]], {i(1, "0"), i(2, "0"), i(3, "0"),i(0)}))

local bmesh_types = s("bmesh.", fmt([[
{}
]], {c(1, {
    t("bmesh.types.BMesh"),
    t("bmesh.types.BMVert"),
    t("bmesh.types.BMEdge")
})}))
return {vector, bmesh_types}
