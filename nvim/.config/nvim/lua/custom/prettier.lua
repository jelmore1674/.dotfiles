local prettier = require("prettier")

local file_types = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
}

prettier.setup({
    bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
    filetypes = file_types,
    cli_options = {
        arrow_parens = "always",
        bracket_spacing = true,
        bracket_same_line = false,
        embedded_language_formatting = "auto",
        end_of_line = "lf",
        html_whitespace_sensitivity = "css",
        -- jsx_bracket_same_line = false,
        jsx_single_quote = true,
        print_width = 80,
        prose_wrap = "preserve",
        quote_props = "as-needed",
        semi = true,
        single_attribute_per_line = false,
        single_quote = true,
        tab_width = 4,
        trailing_comma = "es5",
        use_tabs = true,
        vue_indent_script_and_style = true,
    },
})

return file_types;
-- vim.keymap.set("n", "<Leader>f", prettier.format)
