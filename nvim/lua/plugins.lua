vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer manages itself
    use "wbthomason/packer.nvim"

    -- Dim the inactive splits
    use "sunjon/shade.nvim"

    -- Colorscheme
    use({ "rose-pine/neovim", as = "rose-pine" })

    -- Status line
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }
    use "nvim-tree/nvim-web-devicons"
    require'nvim-web-devicons'.setup()

    -- Comment stuff
    use "numToStr/Comment.nvim"

    -- Fuzzy search
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = {{ "nvim-lua/plenary.nvim" }}
    }

    -- Better syntax highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "p00f/nvim-ts-rainbow"

    -- File explorer
    use "nvim-tree/nvim-tree.lua"

    require("packer").install()
end)
