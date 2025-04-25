return{
	"neovim/nvim-lspconfig",
	config = function()
	vim.lsp.enable('clangd')
	vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
})

	end
}
