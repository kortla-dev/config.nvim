vim.pack.add({
    {
        src = github("nvim-telescope/telescope.nvim"),
        version = "master",
    },
    { src = github("nvim-lua/plenary.nvim") },
    { src = github("nvim-telescope/telescope-fzf-native.nvim") },
    { src = github("nvim-tree/nvim-web-devicons") },
})

local telescope = require("telescope")
local telescope_actions = require("telescope.actions")


telescope.setup({
    defaults = {
        prompt_prefix = " :~$ ", -- TODO: find something better
        sorting_strategy = "ascending",
        path_display = { "truncate" },
        initial_mode = "insert",
        selection_strategy = "reset",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.8,
            preview_cutoff = 120,
        },
        mappings = {
            i = {
                ["<C-k>"] = telescope_actions.move_selection_previous,
                ["<C-j>"] = telescope_actions.move_selection_next,
                ["<C-f>"] = telescope_actions.close,
            },
        },
    },
})
-- telescope.load_extension("fzf")

nmap( "<leader>f", "", { desc = "Telescope bindings" })
nmap( "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
nmap( "<leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
nmap( "<leader>fs", "<Cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
nmap( "<leader>fc", "<Cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
