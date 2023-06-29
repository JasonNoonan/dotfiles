-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- hop.nvim
    ["<leader><leader>w"] = { "<cmd>HopWord<cr>", desc = "Hop to a word" },
    ["<leader><leader>p"] = { "<cmd>HopPattern<cr>", desc = "Hop to a pattern" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "View git diff in Diffview" },
    ["<leader>gdc"] = { "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    ["<leader>ff"] = { "<cmd>Telescope git_files<cr>", desc = "Search all files in git" },
    ["<leader>fs"] = { "<cmd>Telescope git_status<cr>", desc = "Search all changes in git" },
    ["<leader>lg"] = { "<cmd>Neogen<cr>", desc = "Generate annotation for the current node" },
    ["<leader>tn"] = { "<cmd>TestNearest<cr>", desc = "run the test furthest from my eyes" },
    ["<leader>ts"] = { "<cmd>TestSuite<cr>", desc = "run those sweet tests" },
    ["<leader>t."] = { "<cmd>TestLast<cr>", desc = "runs the last test that was run" },
    ["<leader>tv"] = { "<cmd>TestVisit<cr>", desc = "takes you to the last test that was run" },
    -- resize with arrows
    ["<Up>"] = {
      function() require("smart-splits").resize_up(2) end,
      desc = "Resize split up",
    },
    ["<Down>"] = {
      function() require("smart-splits").resize_down(2) end,
      desc = "Resize split down",
    },
    ["<Left>"] = {
      function() require("smart-splits").resize_left(2) end,
      desc = "Resize split left",
    },
    ["<Right>"] = {
      function() require("smart-splits").resize_right(2) end,
      desc = "Resize split right",
    },
    ["<leader>b"] = { name = "Buffer" },
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
  },
  t = {
    ["<c-q>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
  },
}
