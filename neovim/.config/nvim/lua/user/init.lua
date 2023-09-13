return {
	colorscheme = "catppuccin",
	updater = {
		remote = "origin", -- remote to use
		channel = "stable", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = nil, -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_reload = true, -- automatically reload and sync packer after a successful update
		auto_quit = true, -- automatically quit the current session after a successful update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},
	diagnostics = {
		virtual_text = true,
		underline = true,
	},
	lazy = {
		defaults = { lazy = true },
		performance = {
			rtp = {
				-- customize default disabled vim plugins
				disabled_plugins = {
					"tohtml",
					"gzip",
					"matchit",
					"zipPlugin",
					"netrwPlugin",
					"tarPlugin",
					"matchparen",
				},
			},
		},
	},
	lsp = {
		servers = {
			"lexical",
		},
		config = {
			lexical = function()
				return {
					cmd = { "/Users/jasonnoonan/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
					filetypes = {
						"elixir",
						"eelixir",
					},
					root_dir = function(fname)
						return require("lspconfig").util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
					end,
				}
			end,
		},
	},
}
