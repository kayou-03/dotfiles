return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      latex = {
        enabled = true,
        converter = "none",
        highlight = "RenderMarkdownMath",
        top_pad = 0,
        bottom_pad = 0,
      },

      callout = {
        note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
        tip = { raw = "[!TIP]", rendered = "󰌶 Astuce", highlight = "RenderMarkdownSuccess" },
        warning = { raw = "[!WARNING]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn" },
        danger = { raw = "[!DANGER]", rendered = "󰳤 Danger", highlight = "RenderMarkdownError" },
      },
      checkbox = {
        enabled = true,
        custom = {
          -- Tu peux créer tes propres états, ex: [~] pour "En cours"
          pending = { raw = "[~]", rendered = "󰥔 ", highlight = "RenderMarkdownWarn" },
        },
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      vim.opt.conceallevel = 2
    end,
  },

  {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      embed_image_as_base64 = false,
      prompt_for_file_name = false,
      drag_and_drop = {
        insert_mode = true,
      },
      -- Sauvegarde les images dans un sous-dossier 'assets' à côté du fichier
      dir_path = "assets",
    },
  },
  keys = {
    -- Raccourci : <Leader> p pour coller l'image
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Coller une image du presse-papier" },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      -- Faire en sorte que ça s'ouvre automatiquement ou pas
      vim.g.mkdp_auto_start = 0 
      vim.g.mkdp_auto_close = 1
    end,
    ft = { "markdown" },
  }
}
