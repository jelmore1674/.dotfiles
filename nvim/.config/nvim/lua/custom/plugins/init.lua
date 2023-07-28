-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    -- Icons
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/prettier.nvim',
    'sindrets/diffview.nvim',
    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    },

    -- VimBeGood game
    'ThePrimeagen/vim-be-good'
}
