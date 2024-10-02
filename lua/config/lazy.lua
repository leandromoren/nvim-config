--vim.g.lazy_colorscheme = nil
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "sonokai",
        news = {
          lazyvim = true,
          neovim = true,
        },
      },
    },
    -- import/override with your plugins
    -- import extra plugins here
    { "EdenEast/nightfox.nvim", name = "nightfox" }, -- lazy,
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },

  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

--vim.cmd([[colorscheme catppuccin]]) -- Cambia "solarized" por tu esquema preferido
--vim.cmd([[colorscheme  sonokai]])
--vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme melange")

local mel = require("melange/palettes/dark")
for name, attrs in pairs({
  Normal = { fg = mel.a.fg, bg = "#1e1b1a" },
  Whitespace = { fg = "#4e433e", italic = false, nocombine = true },
  --LspInlayHint = { fg = "#4e433e", italic = false, nocombine = true },
  LspInlayHint = { fg = "#70787e", italic = true, nocombine = false },
  ["@lsp.type.namespace"] = { fg = "#78b98A" },
  ["@lsp.type.class"] = { fg = "#73b9be" },
}) do
  vim.api.nvim_set_hl(0, name, attrs)
end
--
