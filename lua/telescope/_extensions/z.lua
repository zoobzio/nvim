local z = require("telescope._extensions.z_builtin")

return require("telescope").register_extension({
	exports = {
		z = z.list,
		list = z.list,
	},
})
