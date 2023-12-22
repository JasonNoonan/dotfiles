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
				noice = true,
				notify = true,
				sandwich = true,
				semantic_tokens = true,
				symbols_outline = true,
				telescope = { enabled = true },
				which_key = true,
			},
		},
		config = function(_, opts)
			vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup(opts)
		end,
		lazy = false,
		priority = 1000,
	},
	{
		"embark-theme/vim",
		name = "embark",
		-- branch = "vim-notify",
		config = function()
			vim.g.embark_terminal_italics = true
		end,
	},
	{ -- Neovim motions on speed!
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended,
		config = function()
			require("hop").setup()
		end,
		keys = {
			{ "<leader><leader>w", "<cmd>HopWord<cr>", desc = "Hop to a word" },
			{ "<leader><leader>p", "<cmd>HopPattern<cr>", desc = "Hop to a pattern" },
		},
		module = "hop",
		opts = true,
		setup = function()
			table.insert(astronvim.file_plugins, "hop.nvim")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"folke/neodev.nvim",
		opt = true,
		setup = function()
			table.insert(astronvim.file_plugins, "neodev.nvim")
		end,
		config = function()
			require("neodev").setup({})
		end,
	},
	{
		"danymat/neogen",
		opt = true,
		setup = function()
			table.insert(astronvim.file_plugins, "neogen")
		end,
		config = function()
			require("neogen").setup({})
		end,
		requires = "nvim-treesitter/nvim-treesitter",
		-- Uncomment next line if you want to follow only stable versions
		-- tag = "*"
	},
	{
		"bennypowers/nvim-regexplainer",
		opt = true,
		setup = function()
			table.insert(astronvim.file_plugins, "nvim-regexplainer")
		end,
		config = function()
			require("regexplainer").setup({
				mappings = {
					toggle = "<leader>lx",
				},
			})
		end,
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"nvim-treesitter/playground",
		config = function()
			require("nvim-treesitter.configs").setup({
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
			})
		end,
	},
	{
		"janko/vim-test",
		dependencies = {
			"tpope/vim-dispatch",
			"preservim/vimux",
		},
		event = "VimEnter",
		config = function()
			vim.g["test#strategy"] = {
				nearest = "vimux_watch",
				file = "vimux_watch",
				suite = "vimux_watch",
			}
			vim.g["preserve_screen"] = true
			vim.g["test#csharp#runner"] = "dotnettest"
			vim.g.VimuxOrientation = "v"
			vim.g.VimuxHeight = "30"
			vim.g["test#custom_strategies"] = {
				vimux_watch = function(args)
					vim.cmd("call VimuxClearTerminalScreen()")
					vim.cmd("call VimuxClearRunnerHistory()")
					vim.cmd(string.format("call VimuxRunCommand('fd . | entr -c %s')", args))
				end,
			}
		end,
		keys = {
			{ "<leader>rr", "<CMD>VimuxPromptCommand<CR>", { desc = "run the runsman" } },
			{ "<leader>r.", "<CMD>VimuxRunLastCommand<CR>", { desc = "run the last run command" } },
			{ "<leader>rc", "<CMD>VimuxClearTerminalScreen<CR>", { desc = "clear the current run terminal" } },
			{ "<leader>rq", "<CMD>VimuxCloseRunner<CR>", { desc = "close the runner" } },
			{ "<leader>r?", "<CMD>VimuxInspectRunner<CR>", { desc = "inspect the runner" } },
			{ "<leader>r!", "<CMD>VimuxInterruptRunner<CR>", { desc = "interrupt the runner (bang'er)" } },
			{ "<leader>rz", "<CMD>VimuxZoomRunner<CR>", { desc = "zoom the runner" } },
			{ "<leader>tt", "<cmd>TestFile<cr>", { desc = "run test watcher" } },
			{ "<leader>tT", "<cmd>TestFile -strategy=vimux<cr>", { desc = "run test for whole file" } },
			{ "<leader>tn", "<cmd>TestNearest<cr>", { desc = "run nearest test to cursor" } },
			{ "<leader>tN", "<cmd>TestNearest -strategy=vimux<cr><cr>", { desc = "run nearest test to cursor" } },
			{ "<leader>ts", "<cmd>TestSuite<cr>", { desc = "run test suite" } },
			{ "<leader>tS", "<cmd>TestSuite -strategy=vimux<cr><cr>", { desc = "run test suite" } },
			{ "<leader>t.", "<cmd>TestLast<cr>", { desc = "re-run the last test run" } },
			{ "<leader>tv", "<cmd>TestVisit<cr>", { desc = "visit the last run test" } },
		},
	},
	{
		"mattn/emmet-vim",
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
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"tpope/vim-projectionist",
		config = function()
			vim.g.projectionist_heuristics = {
				["*"] = {
					["*.ex"] = {
						alternate = {
							"{}_test.exs",
						},
						type = "source",
					},
					["*_test.exs"] = {
						alternate = {
							"{}.ex",
						},
					},
				},
			}
		end,
		keys = {
			{ "<leader>t<backspace>", "<cmd>A<cr>", { description = "jump to test from source file or viceversa" } },
		},
		event = "VeryLazy",
	},
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = true
			vim.g.db_ui_execute_on_save = false
			vim.g.db_ui_save_location = "./json_queries"
			vim.g.db_ui_disable_mappings = false
			vim.g.db_url = os.getenv("DBUI_URL")
		end,
		cmd = {
			"DBUI",
		},
		keys = {
			{
				"<leader><leader>r",
				":normal vip<CR><PLUG>(DBUI_ExecuteQuery)",
				{ description = "run the sql query (dadbod)" },
			},
			{
				"<leader><leader>d",
				"<cmd>DBUI<cr>",
				{ description = "start the dadbod UI" },
			},
		},
	},
	{
		"tpope/vim-fugitive",
		dependencies = { "tpope/vim-rhubarb" },
		event = "VimEnter",
		keys = {
			{ "<leader><leader>gl", ":Gclog<CR>", { description = "git log" } },
			{ "<leader><leader>gh", ":0Gclog<CR>", { description = "git history for current file" } },
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = {
			lsp = {
				signature = {
					enabled = false,
				},
				hover = {
					enabled = false,
				},
				message = {
					enabled = true,
					view = "notify",
				},
			},
		},
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
	},
	{
		"iamcco/markdown-preview.nvim",
		event = "BufRead",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		init = function()
			vim.g.tmux_navigator_disable_when_zoomed = true
		end,
	},
	-- no config needed plugins
	{ "chaoren/vim-wordmotion" }, -- More useful word motions for Vim
	{ "andymass/vim-matchup" }, -- vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen
}
