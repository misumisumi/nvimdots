return {
	max_concurrent_installers = os.getenv("CI") == 1 and 2 or 4,
}
