require("insis").setup({
  s_tab = {
    enable = true,
  },
  json = {
    enable = true,
  },
  markdown = {
    enable = true,
  },
  bash = {
    enable = true,
    lsp = "bashls",
    --  brew install shfmt
    formatter = "shfmt",
    format_on_save = false,
    indent = 4,
  },
  python = {
    enable = true,
    lsp = "pyright",
  },
  cmp = {
    copilot = true,
  },
  copilot_chat = {
    enable = true,
  },
  clangd = {
    enable = true,
  },
})
