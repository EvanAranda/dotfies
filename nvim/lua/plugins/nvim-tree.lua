require("nvim-tree").setup({
    sort_by = "case_sensitive",
    filters = {
        custom = {
            "^.git$"
        }
    }
})

