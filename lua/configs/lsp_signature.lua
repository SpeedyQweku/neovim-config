--- lsp_signature
-----------------
local cfg = {
	on_attach = function(client, bufnr)
		require("lsp_signature").on_attach({
			bind = true, -- This is mandatory, otherwise border config won't get registered.
			handler_opts = {
				border = "rounded",
			},
		}, bufnr)
	end,
	...,
}
-- require("lsp_signature").setup(cfg)
