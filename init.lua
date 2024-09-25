require("insis").setup({

  colorscheme = "tokyonight",

  s_tab = {
    enable = true,
  },

  json = {
    enable = true,
    -- 以下为默认值，可以省略
  },

  markdown = {
    enable = true,
    -- 以下为默认值，可以省略
  },

  bash = {
    enable = true,
  },

  python = {
    enable = true,
  },
})

--[[require("nvim-tree").setup({
  -- 默认配置
  system_open = {
    -- 确保使用正确的命令
    cmd = nil, -- 默认为空，通常会自动检测
    args = {},
  },
})]]
--
