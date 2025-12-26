return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup({
            -- signs = {
            --     add = { text = '+' },
            --     change = { text = '~' },
            --     delete = { text = '_' },
            --     topdelete = { text = '‾' },
            --     changedelete = { text = '~' },
            -- },
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')
                local wk = require('which-key')

                wk.add({
                    {'<leader>h', group = 'Hunks', mode = {'n', 'v'}}
                })

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                local function stage_line()
                    gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})
                end

                local function reset_line()
                    gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})
                end

                -- Navigation
                map('n', ']h', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']h', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end, {desc = 'Next hunk'})
                map('n', '[h', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[h', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end, {desc = 'Previous hunk'})

                -- Actions
                map('n', '<leader>hs', gitsigns.stage_hunk, {desc = 'Stage hunk'})
                map('v', '<leader>hs', stage_line, {desc = 'Stage selection'})
                map('n', '<leader>hr', gitsigns.reset_hunk, {desc = 'Reset hunk'})
                map('v', '<leader>hr', reset_line, {desc = 'Reset selection'})
                map('n', '<leader>hS', gitsigns.stage_buffer, {desc = 'Stage buffer'})
                map('n', '<leader>hR', gitsigns.reset_buffer, {desc = 'Reset buffer'})
                map('n', '<leader>hp', gitsigns.preview_hunk, {desc = 'Preview hunk'})
                map('n', '<leader>hP', gitsigns.preview_hunk_inline, {desc = 'Preview hunk inline'})
                map('n', '<leader>hb', function()
                    gitsigns.blame_line({ full = true })
                end, {desc = 'Blame'})
            end
        })
    end
}
