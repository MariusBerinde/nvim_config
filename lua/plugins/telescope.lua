local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- Telescope
	vim.keymap.set("n", "<F2>", telescope.find_files)
	vim.keymap.set("n", "<leader>fg", telescope.live_grep)
	vim.keymap.set("n", "<leader>fb", telescope.buffers)
	vim.keymap.set("n", "<leader>fh", telescope.help_tags)
	vim.keymap.set("n", "<leader>fs", telescope.git_status)
	vim.keymap.set("n", "<leader>fc", telescope.git_commits)
	vim.keymap.set('n', '<leader>H', telescope.help_tags)
else
	print("Telescope not found")
end
