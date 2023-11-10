local Ai = {}

local function setup_chatgpt()
	require("chatgpt").setup({
		api_key_cmd = "pass neovim/openai",
	})
end

function Ai.setup()
	setup_chatgpt()
end

return Ai
