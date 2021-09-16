local vim = vim

local set_keymap = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent= true})
end

local setup_mappings = function()
    vim.cmd[[let g:airline_powerline_fonts = 1]]
    vim.cmd[[let g:livepreview_previewer = 'zathura']]
    set_keymap('n', '<C-k>', ':Lexplore<CR>')
end

setup_mappings()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd Filetype tex setl updatetime=1
  augroup end
]])
