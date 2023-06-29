return {
  -- You can disable default plugins as follows:
  -- ["goolord/alpha-nvim"] = { disable = true },
  {
		"catppuccin/nvim", -- Soothing pastel theme for Neovim
		name = "catppuccin",
		opts = {
			dim_inactive = { enabled = true, percentage = 0.25 },
			integrations = {
				nvimtree = false,
				aerial = true,
				dap = { enabled = true, enable_ui = true },
				mason = true,
				neotree = true,
				notify = true,
				sandwich = true,
				semantic_tokens = true,
				symbols_outline = true,
				telescope = true,
				which_key = true,
			},
		},
		config = function()
			vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup()
		end,
		lazy = false,
		priority = 1000,
	}, 
  ["phaazon/hop.nvim"] = { -- Neovim motions on speed!
    branch = "v2", -- optional but strongly recommended,
    config = function() require("hop").setup() end,
    module = "hop",
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "hop.nvim") end,
  },
  ["ray-x/lsp_signature.nvim"] = { -- LSP signature hint as you type
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  ["folke/neodev.nvim"] = { -- 💻 Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "neodev.nvim") end,
    config = function() require("neodev").setup {} end,
  },
  ["danymat/neogen"] = { -- A better annotation generator. Supports multiple languages and annotation conventions.
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "neogen") end,
    config = function() require("neogen").setup {} end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  },
  ["bennypowers/nvim-regexplainer"] = { -- Describe the regexp under the cursor
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "nvim-regexplainer") end,
    config = function()
      require("regexplainer").setup {
        mappings = {
          toggle = "<leader>lx",
        },
      }
    end,
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
  },
  ["nvim-treesitter/playground"] = { -- Treesitter playground integrated into Neovim
    config = function()
      require("nvim-treesitter.configs").setup {
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      }
    end,
  },
  ["mattn/emmet-vim"] = {
    ft = { "svelte", "html", "heex", "elixir", "javascript" },
    config = function()
      vim.g.user_emmet_settings = {
        ["javascript.jsx"] = {
          extends = "jsx",
        },
        elixir = {
          extends = "html",
        },
        eelixir = {
          extends = "html",
        },
        heex = {
          extends = "html",
        },
      }
      vim.g.user_emmet_mode = "inv"
    end,
  },
  ["janko/vim-test"] = {
    config = function()
      vim.g["test#strategy"] = {
        nearest = "neovim",
        file = "neovim",
        suite = "neovim",
      }
      vim.g["preserve_screen"] = true
    end,
  },
  -- no config needed plugins
  { "chaoren/vim-wordmotion" }, -- More useful word motions for Vim
  { "andymass/vim-matchup" }, -- vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen
}
