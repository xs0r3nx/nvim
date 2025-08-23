    -- Example with lazy.nvim
    return {
        'stevearc/conform.nvim',
        config = function()
            require('conform').setup({
                -- Your configuration here
		         formatters_by_ft = {
            c = { "clang-format" },
            cpp = { "clang-format" },
            -- You can add extra arguments if needed:
            -- cpp = { { "clang-format", extra_args = { "--style=file" } } },
        },
        -- Optional: Configure formatting on save
        format_on_save = {
            lsp_fallback = true, -- Use LSP formatting if conform fails
            async = true,
            timeout_ms = 1000,
        },
            })
        end,
    }
