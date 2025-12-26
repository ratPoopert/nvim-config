return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        delay = 0,
        icons = {
            mappings = vim.g.have_nerd_font,
            keys = {},
        },
    },
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },
    },
    dependencies = {
        {'nvim-mini/mini.icons'},
        {'nvim-tree/nvim-web-devicons'},
    },
}
