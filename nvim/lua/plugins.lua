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

    -- Snippets
    use "dcampos/nvim-snippy"
    use "honza/vim-snippets"

    -- Completion engine
    use "hrsh7th/nvim-cmp"
    -- Cmp sources
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "dcampos/cmp-snippy"

    -- Language Server Protocol
    use "onsails/lspkind.nvim"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use "mfussenegger/nvim-jdtls"

    require("packer").install()
end)
