return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    indent = {
      enabled = true,
      animate = {
        enabled = true,
        style = 'out',
        duration = {
          step = 30,
          total = 400,
        },
      },
      scope = {
        enabled = true,
      },
    },
  },
}
