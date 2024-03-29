-- Stolen from ThePrimeagen
local M = {}

local function bind(op, outer_opts) -- define function that takes two args
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts) -- this function returns a function that takes 3 args
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.inoremap = bind("i")
M.vnoremap = bind("v")
M.xnoremap = bind("x")

return M
