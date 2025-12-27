return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = 'mocha', -- latte, frappe, macchiato, mocha
                transparent_background = true, -- disables setting the background color.
                float = {
                    transparent = false, -- enable transparent floating windows
                    solid = true, -- use solid styling for floating windows, see |winborder|
                },
                auto_integrations = true,
            })
            vim.cmd.colorscheme 'catppuccin'
        end,
    },
}
