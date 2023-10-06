return {
	{ "williamboman/mason.nvim", opts = { PATH = "append" } },
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
			ensure_installed = {
				"tsserver",
				"rust_analyzer",
				"lua_ls",
				"yamlls",
				"html",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		config = function()
			local mason_null_ls = require("mason-null-ls")
			local null_ls = require("null-ls")
			mason_null_ls.setup({
				ensure_installed = { "prettierd", "eslint_d", "stylua", "eslint-lsp", "rustfmt" },
				handlers = {
					prettierd = function()
						null_ls.register(null_ls.builtins.formatting.prettierd.with({
							extra_filetypes = { "markdown", "rmd", "qmd" },
						}))
					end,
				},
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			automatic_setup = true,
			handlers = {
				coreclr = function(_)
					local dap = require("dap")
					dap.set_log_level("DEBUG")

					dap.adapters.coreclr = {
						type = "executable",
						command = "/usr/local/netcoredbg",
						args = { "--interpreter=vscode", "--engineLogging=dap_log.txt" },
					}

					dap.configurations.cs = {
						{
							type = "coreclr",
							name = "launch - Janus.Web",
							request = "launch",
							program = function()
								return vim.fn.input({
									prompt = "Path to dll: ",
									default = vim.fn.getcwd(),
									completion = "file",
								})
							end,
						},
					}
				end,
				elixir = function(_)
					local dap = require("dap")

					dap.adapters.mix_task = {
						type = "executable",
						command = "/Users/jasonnoonan/.local/share/nvim/mason/packages/elixir-ls/debugger.sh", -- debugger.bat for windows
						args = {},
					}

					dap.configurations.elixir = {
						{
							type = "mix_task",
							name = "mix test",
							task = "test",
							taskArgs = { "--trace" },
							request = "launch",
							startApps = true, -- for Phoenix projects
							projectDir = "${workspaceFolder}",
							requireFiles = {
								"test/**/test_helper.exs",
								"test/**/*_test.exs",
							},
						},
						{
							type = "mix_task",
							name = "phx.server",
							request = "launch",
							task = "phx.server",
							projectDir = function()
								return vim.fn.getcwd()
							end,
						},
					}
				end,
			},
		},
	},
}
