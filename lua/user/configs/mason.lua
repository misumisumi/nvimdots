return {
	max_concurrent_installers = os.getenv("CI") and 2 or 4,
}
