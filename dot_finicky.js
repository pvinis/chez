module.exports = {
	defaultBrowser: "Firefox",
	handlers: [
	  {
		match: finicky.matchHostnames(["meet.google.com"]),
		browser: "Google Chrome"
	  },
	]
}
