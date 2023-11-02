return {
  colorscheme = "catppuccin",

  plugins = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("catppuccin").setup {
          flavour = "frappe",
          transparent_background = true,
        }
      end,
    },
  },
}

