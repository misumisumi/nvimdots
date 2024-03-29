return {
	ensure_installed = {
		"shellcheck",
	},
	auto_update = false,
	run_on_start = true,
	start_delay = 0,
	-- debounce_hours = 24, -- at least 5 hours between attempts to install/update
}
