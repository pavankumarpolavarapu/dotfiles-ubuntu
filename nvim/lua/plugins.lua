local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'preservim/NERDTree'
    --use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }

    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'jistr/vim-nerdtree-tabs'
    use 'majutsushi/tagbar'
    use 'vim-scripts/indentpython.vim'
    use 'lepture/vim-jinja'
    use 'joshdick/onedark.vim'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-fugitive'
    use 'jiangmiao/auto-pairs'
    use 'vim-airline/vim-airline' 
    use 'ryanoasis/vim-devicons'
    use 'jremmen/vim-ripgrep'
    -- A Vim Plugin for Lively Previewing LaTeX PDF Output
    use 'xuhdev/vim-latex-live-preview'

end)
