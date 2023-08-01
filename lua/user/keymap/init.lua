local plug_map = {}

plug_map = vim.tbl_extend(
	"force",
	plug_map,
	require("user.keymap.editor"),
	require("user.keymap.tool"),
	require("user.keymap.ui").plug_map
)

return plug_map
