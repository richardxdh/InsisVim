local cfg = require("insis").config

local plugins = {
  -------------------------- plugins -------------------------------------------
  -- requires
  { "nvim-tree/nvim-web-devicons" },
  { "moll/vim-bbye" },
  { "nvim-lua/plenary.nvim",      branch = "master" },
  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require("insis.plugins.nvim-notify")
    end,
  },
  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("insis.plugins.nvim-tree")
    end,
  },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("insis.plugins.bufferline")
    end,
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("insis.plugins.lualine")
    end,
  },

  -- telescope
  -- telescope extensions
  { "LinArcX/telescope-env.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    -- opt = true,
    -- cmd = "Telescope",
    config = function()
      require("insis.plugins.telescope")
    end,
  },

  -- alpha.nvim
  {
    "goolord/alpha-nvim",
    config = function()
      require("insis.plugins.alpha")
    end,
  },

  -- treesitter
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("insis.plugins.rainbow-delimiters")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("insis.plugins.treesitter")
    end,
  },
  { "windwp/nvim-ts-autotag" },
  { "nvim-treesitter/nvim-treesitter-refactor" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "RRethy/nvim-treesitter-endwise" },

  -- Comment
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("insis.plugins.comment")
    end,
  },

  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("insis.plugins.indent-blankline")
    end,
  },
  -- use indent-blankline or hlchunk ?
  ------------------------------------
  {
    "shellRaining/hlchunk.nvim",
    config = function()
      require("insis.plugins.hlchunk")
    end,
  },
  -------------------------------------
  -- toggleterm
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("insis.plugins.toggleterm")
    end,
  },

  -- nvim-surround
  -- {
  --   "kylechui/nvim-surround",
  --   config = function()
  --     require("insis.plugins.nvim-surround")
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    -- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
    -- config = function()
    --     require("nvim-surround").setup({
    --         -- Put your configuration here
    --     })
    -- end
  },

  -- nvim-autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("insis.plugins.autopairs")
    end,
  },

  -- fidget.nvim
  {
    "j-hui/fidget.nvim",
    -- tag = "legacy",
    config = function()
      require("insis.plugins.fidget")
    end,
  },

  -- todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    config = function()
      require("insis.plugins.todo-comments")
    end,
  },

  -- venn.nvim
  {
    "jbyuki/venn.nvim",
    config = function()
      require("insis.plugins.venn")
    end,
  },

  -- zen mode
  {
    "folke/zen-mode.nvim",
    config = function()
      require("insis.plugins.zen-mode")
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("insis.plugins.nvim-ufo")
    end,
  },

  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
      filesize = 1,
    },
    config = function(_, opts)
      require("bigfile").setup(opts)
    end,
  },

  ------------------ Markdown -------------------------------------------------
  {
    "jakewvincent/mkdnflow.nvim",
    -- ft = { "markdown" }, -- lazy load
    config = function()
      require("insis.plugins.mkdnflow")
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    enabled = function()
      local cfg = require("insis").config.markdown
      return cfg and cfg.enable
    end,
    config = function()
      require("insis.plugins.markdown-preview")
    end,
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },

  ------------------ LSP ------------------------------------------------------

  -- Installer
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  -- Lspconfig
  { "neovim/nvim-lspconfig",                    tag = "v2.4.0" },
  -- Completion engine
  { "hrsh7th/nvim-cmp" },
  -- Snippet engine
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  -- Completion sources
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/cmp-nvim-lsp" },                -- { name = nvim_lsp }
  { "hrsh7th/cmp-buffer" },                  -- { name = 'buffer' },
  { "hrsh7th/cmp-path" },                    -- { name = 'path' }
  { "hrsh7th/cmp-cmdline" },                 -- { name = 'cmdline' }
  { "hrsh7th/cmp-nvim-lsp-signature-help" }, -- { name = 'nvim_lsp_signature_help' }
  -- common snippets
  { "rafamadriz/friendly-snippets" },
  -- UI improvement
  { "onsails/lspkind-nvim" },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    opts = {}, -- your configuration
  },

  ------------------ Code formatter -------------------------------------------

  -- { "mhartington/formatter.nvim" },
  -- { "jose-elias-alvarez/null-ls.nvim" },
  { "nvimtools/none-ls.nvim" },

  ------------------ Language enhancement -------------------------------------

  -- TypeScript
  -- { "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" },
  -- { "jose-elias-alvarez/typescript.nvim" },
  {
    "pmizio/typescript-tools.nvim",
    config = function()
      require("insis.plugins.typescript-tools")
    end,
  },
  -- JSON
  { "b0o/schemastore.nvim" },
  -- Java
  { "mfussenegger/nvim-jdtls" },

  --------------------- colorschemes ------------------------------------------

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    config = function()
      require("insis.plugins.tokyonight")
    end,
  },

  -- gruvbox
  { "rktjmp/lush.nvim" },
  { "ellisonleao/gruvbox.nvim" },

  -- nord
  { "shaunsingh/nord.nvim" },

  -- onedark
  { "ful1e5/onedark.nvim" },

  -- nightfox
  { "EdenEast/nightfox.nvim" },

  -- dracula
  { "Mofiqul/dracula.nvim" },

  -- kanagawa
  { "rebelot/kanagawa.nvim" },

  --------------------- git ---------------------------------------------------

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("insis.plugins.gitsigns")
    end,
  },

  {
    "tpope/vim-fugitive",
    -- config = function()
    --   require("insis.plugins.fugitive")
    -- end,
  },

  --------------------- DAP ---------------------------------------------------

  -- vimspector
  -- {
  --   "puremourning/vimspector",
  --   cmd = { "VimspectorInstall", "VimspectorUpdate" },
  --   fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
  --   config = function()
  --     require("dap.vimspector")
  --   end,
  -- },

  -- nvim-dap
  { "mfussenegger/nvim-dap" },
  { "theHamsta/nvim-dap-virtual-text" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },

  -- node
  { "mxsdev/nvim-dap-vscode-js" },

  -- go
  { "leoluz/nvim-dap-go" },

  -- python
  -- pip install debugpy
  { "mfussenegger/nvim-dap-python" },

  --[[
  {
  "mfussenegger/nvim-dap-python",
  requires = { "mfussenegger/nvim-dap" },
  config = function()
  require("dap-python").setup("/rs/nn/.local/share/nvim/mason/bin/debugpy")
  end,
  }

  --]]

  ----------------- neotest ---------------------------
  { "nvim-neotest/neotest-go" },
  {
    "nvim-neotest/neotest",
    config = function()
      require("insis.plugins.neotest")
    end,
  },

  ----------------- ai ---------------------------
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("insis.plugins.copilot").copilot()
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("insis.plugins.copilot").copilot_cmp()
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("insis.ai.codecompanion.codecompanion")
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    build = "make tiktoken",        -- Only on MacOS or Linux
    config = function()
      require("insis.plugins.copilot").copilot_chat()
    end,
  },

  -- Codeium
  -- {
  --   "Exafunction/codeium.nvim",
  --   config = function()
  --     require("insis.plugins.codeium").init()
  --   end,
  -- },

  -- {
  --   "folke/which-key.nvim",
  --   config = function()
  --     require("which-key").setup({
  --       -- 插件的具体配置可以写在这里（可选）
  --     })
  --   end,
  -- },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    triggers = {
      { "<auto>", mode = "nixsotc" },
      { "a",      mode = { "n", "v" } },
    },
  },

  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("telescope").setup({})
  --   end,
  -- },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("insis.plugins.noice")
    end,
  },

  {
    "yetone/avante.nvim",
    -- 如果您想从源代码构建，请执行 `make BUILD_FROM_SOURCE=true`
    -- ⚠️ 一定要加上这一行配置！！！！！
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false, -- 永远不要将此值设置为 "*"！永远不要！
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- 在此处添加任何选项
      -- 例如
      provider = "poe_gpt_5_3_codex",
      providers = {
        m_openai = {
          __inherited_from = "openai",
          endpoint = "https://api.iseed.nyc.mn/v1",
          api_key_name = "MOPENAI_API_KEY",
          model = "gpt-5.3-codex",
          disable_tools = true,
          timeout = 120000, -- 120秒
          stream = false,   -- 禁用流式传输
        },
        poe_gpt_5_3_codex = {
          __inherited_from = "openai",
          endpoint = "https://api.poe.com/v1",
          api_key_name = "POE_API_KEY",
          model = "gpt-5.3-codex",
          disable_tools = true,
          timeout = 120000, -- 120秒
          stream = false,   -- 禁用流式传输
        },
        poe_claude_opus_4_6 = {
          __inherited_from = "openai",
          endpoint = "https://api.poe.com/v1",
          api_key_name = "POE_API_KEY",
          model = "claude-opus-4.6",
          timeout = 120000, -- 120秒
          stream = false,   -- 禁用流式传输
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- 以下依赖项是可选的，
      "echasnovski/mini.pick",         -- 用于文件选择器提供者 mini.pick
      "nvim-telescope/telescope.nvim", -- 用于文件选择器提供者 telescope
      "hrsh7th/nvim-cmp",              -- avante 命令和提及的自动完成
      "ibhagwan/fzf-lua",              -- 用于文件选择器提供者 fzf
      "nvim-tree/nvim-web-devicons",   -- 或 echasnovski/mini.icons
      "zbirenbaum/copilot.lua",        -- 用于 providers='copilot'
      {
        -- 支持图像粘贴
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- 推荐设置
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- Windows 用户必需
            use_absolute_path = true,
          },
        },
      },
      {
        -- 如果您有 lazy=true，请确保正确设置
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

-- Rust
if cfg.rust.enable then
  table.insert(plugins, {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false,   -- This plugin is already lazy
  })
end

return plugins
