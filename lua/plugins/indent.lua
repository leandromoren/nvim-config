local highlight = {
  "whitespace",
}
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = { highlight = highlight, char = "♰" },
      scope = { enabled = false },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
    },
  },
}
