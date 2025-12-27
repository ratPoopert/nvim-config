return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'nvim-telescope/telescope-fzf-native.nvim',
    'sharkdp/fd',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('telescope').setup({
      defaults = {
        sorting_strategy = 'descending',
        selection_strategy = 'reset',
        scroll_strategy = 'cycle',
        layout_strategy = 'horizontal',
        create_layout = nil,
      },
      pickers = {},
      extensions = {},
    })
  end
}
