-- Quickfix tomfoolery

-- no idea what the point of the group is, should probably learn it.
local group = vim.api.nvim_create_augroup("QuickFix", {clear = true})

-- map j to view error from the quicklist, but immediately switch back to the
-- quicklist window.
vim.api.nvim_create_autocmd("FileType",
{ pattern = "qf",
callback = function() vim.keymap.set("n", "j", ":cn<cr><c-w><c-p>", {buffer = true} ) end,
group = group
})

-- map k to previous item in quicklist, switch back to the window.
vim.api.nvim_create_autocmd("FileType",
{ pattern = "qf",
callback = function() vim.keymap.set("n", "k", ":cp<cr><c-w><c-p>", {buffer = true} ) end,
group = group
})

-- map Enter to close the quickfix window, "select" the current item.
vim.api.nvim_create_autocmd("FileType",
{ pattern = "qf",
callback = function() vim.keymap.set("n", "<cr>", ":ccl<cr><c-w><c-p>", {buffer = true} ) end,
group = group
})

-- Example abbreviation. rhs can't have a space because abbreviations expand on space.
-- It'll throw an error. 'remap' is by default set to false
vim.api.nvim_create_autocmd("FileType",
{ pattern = "python",
  callback = function()
      vim.keymap.set("ia", "elseif", "elif", {buffer = true, remap = false} )
  end,
})

-- see :h abbreviations
function Eatchar(pat)
    local c = vim.fn.nr2char(vim.fn.getchar(0))
    if c == pat then
        return ''
    else
        return c
    end
end
vim.api.nvim_create_autocmd("FileType",
{ pattern = "javascript",
  callback = function()
      vim.keymap.set("ia", "avail@", "if (Java.available){}<Left><CR><Esc>OJava.perform()<Left><CR><Esc>O() => {}<Left><CR><Esc>O", {buffer = true} )
  end,
})

vim.api.nvim_create_autocmd("FileType",
{ pattern = "javascript",
  callback = function()
      vim.keymap.set("ia", "impl@", "implementation = function(){}<Left><CR><Esc>ko", {buffer = true} ) 
  end,
})
