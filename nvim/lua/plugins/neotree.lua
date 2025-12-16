return {
   "nvim-neo-tree/neo-tree.nvim",
   opts = {
      filesystem = {
         filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
         },
      },
      default_component_configs = {
         git_status = {
            symbols = {
               ignored = "",
            },
         },
      },
      window = {
         mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
         },
      },
   },
}
