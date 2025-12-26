return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup({
            on_attach = function(bufnr)
                local gs = require('gitsigns')
                local wk = require('which-key')

                local function maybe_prev_hunk()
                    if vim.wo.diff then vim.cmd.normal({'[h', bang = true}) else gs.nav_hunk('prev') end
                end

                local function maybe_next_hunk()
                    if vim.wo.diff then vim.cmd.normal({']h', bang = true}) else gs.nav_hunk('next') end
                end

                wk.add({
                    { '[', group = 'Previous' },
                    { ']', group = 'Next'     },
                    { '[h', maybe_prev_hunk, desc = 'Previous [h]unk', buffer = bufnr },
                    { ']h', maybe_next_hunk, desc = 'Next [h]unk',     buffer = bufnr },

                    { '<leader>g', group = '[g]it' },

                    { '<leader>gs', gs.stage_hunk,          desc = '[s]tage hunk',          buffer = bufnr },
                    { '<leader>gr', gs.reset_hunk,          desc = '[r]eset hunk',          buffer = bufnr },
                    { '<leader>gp', gs.preview_hunk,        desc = '[p]review hunk',        buffer = bufnr },
                    { '<leader>gP', gs.preview_hunk_inline, desc = '[P]review hunk inline', buffer = bufnr },
                    { '<leader>gS', gs.stage_buffer,        desc = '[S]tage buffer',        buffer = bufnr, mode = {'n', 'v'} },
                    { '<leader>gR', gs.reset_buffer,        desc = '[R]eset buffer',        buffer = bufnr, mode = {'n', 'v'} },

                    { '<leader>gs', gs.stage_hunk({vim.fn.line('.'), vim.fn.line('v')}), desc = '[s]tage selection', buffer = bufnr, mode = 'v' },
                    { '<leader>gr', gs.reset_hunk({vim.fn.line('.'), vim.fn.line('v')}), desc = '[r]eset selection', buffer = bufnr, mode = 'v' },

                    { '<leader>gb', function() gs.blame_line{full = true } end, desc = '[b]lame', buffer = bufnr },
                    { '<leader>gd', gs.diffthis, desc = '[d]iff this' , buffer = bufnr },
                    -- { '<leader>gD', function() gs.diffthis('~') end, buffer = bufnr },

                    -- Toggles
                    { '<leader>t', group = '[t]oggles' },
                    { '<leader>tb', gs.toggle_current_line_blame, desc = 'Toggle line [b]lame', buffer = bufnr },
                    { '<leader>tw', gs.toggle_word_diff, desc = 'Toggle [w]ord diff', buffer = bufnr },
                })
            end
        })
    end
}
