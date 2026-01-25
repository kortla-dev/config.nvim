---@diagnostic disable: lowercase-global

function github(repo)
    return "https://github.com/" .. repo
end

function codeberg(repo)
    return "https://codeberg.org/" .. repo
end

---util function for setting vim normal keymap
---@param keys any
---@param action any
---@param opts any
function nmap(keys, action, opts)
    vim.keymap.set("n", keys, action, opts)
end

---util function for setting vim insert keymap
---@param keys any
---@param action any
---@param opts any
function imap(keys, action, opts)
    vim.keymap.set("i", keys, action, opts)
end


---util function for setting vim visual keymap
---@param keys any
---@param action any
---@param opts any
function vmap(keys, action, opts)
    vim.keymap.set("v", keys, action, opts)
end

