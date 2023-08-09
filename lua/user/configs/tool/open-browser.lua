return function()
	vim.g.openbrowser_search_engines = {
		["duckduckgo"] = "https://duckduckgo.com/?q={query}",
		["fileformat"] = "https://www.fileformat.info/info/unicode/char/{query}/",
		["github"] = "https://github.com/search?q={query}",
		["go"] = "https://pkg.go.dev/search?q={query}",
		["google"] = "https://google.com/search?q={query}",
		["php"] = "https://php.net/{query}",
		["python"] = "https://docs.python.org/dev/search.html?q={query}&check_keywords=yes&area=default",
		["twitter-search"] = "https://twitter.com/search/{query}",
		["twitter-user"] = "https://twitter.com/{query}",
		["wikipedia"] = "https://en.wikipedia.org/wiki/{query}",
		["wikipedia-ja"] = "https://ja.wikipedia.org/wiki/{query}",
		["archwiki"] = "https://wiki.archlinux.jp/index.php/{query}",
		["nixos"] = " https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={query}",
		["nixpkgs"] = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={query}",
		["qiita"] = "https://qiita.com/search?q={query}",
		["reddit"] = "https://www.reddit.com/search?q={query}",
		["startpage"] = "https://www.startpage.com/do/search?q={query}",
		["zenn"] = "https://zenn.dev/search?q={query}",
	}
	vim.g.openbrowser_default_search = "startpage"
	vim.g.openbrowser_use_vimproc = 1
end