return{
	"neovim/nvim-lspconfig",
	config = function()
	vim.lsp.enable('clangd')
	vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
})

	end
}
