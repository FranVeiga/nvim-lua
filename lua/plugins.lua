return require('packer').startup(function(use)

    use {'wbthomason/packer.nvim'}

    -- ESSENTIALS
    -- lspconfig DONE
    -- lsp installer DONE
    -- treesitter DONE
    -- telescope DONE
    -- cmp DONE
    -- whichkey + keybindings
    -- luasnip (not essential) DONE

    use {'neovim/nvim-lspconfig'}
    use {'williamboman/nvim-lsp-installer'}

    use { 'nvim-treesitter/nvim-treesitter',
        config = function ()
            require'core.treesitter'
        end,
    }

    use {'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function () require 'core.telescope' end
    }



    use {'hrsh7th/nvim-cmp',
        requires = { {'hrsh7th/cmp-nvim-lsp'},
                     {'hrsh7th/cmp-buffer'},
                     {'hrsh7th/cmp-path'},
                     {'hrsh7th/cmp-nvim-lua'},
                     {'hrsh7th/cmp-cmdline'}, },

        config = function () require 'core.cmp' end
    }


    use {'L3MON4D3/LuaSnip',
        requires = { {'saadparwaiz1/cmp_luasnip'},
                     {'rafamadriz/friendly-snippets'} },
    }

    use {"folke/which-key.nvim",
        config = function () require 'core.whichkey' end
    }


    use { "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter"
    }

    use {'tpope/vim-surround'}


    use {"s1n7ax/nvim-terminal",
        config = function()
        local terminal = require 'nvim-terminal'
        terminal.setup({
            disable_default_keymaps = true
            })

        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {'windwp/nvim-autopairs',
        config = function() require'nvim-autopairs'.setup() end
    }

    end

)


