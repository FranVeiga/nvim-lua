local wk = require "which-key"

local opts = {
    plugins = {
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        marks = true, -- shows a list of your marks on ' and `
    },
    presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },

      icons = {
          breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
          separator = "➜", -- symbol used between a key and it's label
          group = "+", -- symbol prepended to a group
      },
      window = {
          border = "none", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0
    },

    layout = {
        align = "center"
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true
}



wk.setup(opts)

-- NORMAL MODE
wk.register(
    {
      ["/"] = { "<cmd>lua require('Comment').toggle()<CR>", "Comment" },

      -- WINDOWS
      ["w"] = {
            v = {"<cmd>vsplit<cr>", "Vsplit"},
            s = {"<cmd>split<cr>", "Hsplit"},

            c = {"<C-w>q", "Close window"},
            T = {"<C-w>T", "Break out"},
      },


      -- FILES
      ["f"] = {
            name = "File",

            f = {"<cmd>Telescope find_files<cr>", "Find"},
            r = {"<cmd>Telescope oldfiles<cr>", "Recent"},
            s = {"<cmd>w<cr>", "Save"},
      },

      ["b"] = {
          name = "Buffer"
        },

      ["t"] = {
          name = "Telescope",
          t = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
          h = {"<cmd>Telescope help_tags<cr>", "Help"},
          m = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
    },


      -- No highliht
      ["h"] = {"<cmd>noh<cr>", "No highlight"},

      -- QUIT ALL
      ["Q"] = {"<cmd>qa!<cr>", "QUIT ALL"},
    },

    {
        prefix = "<leader>",
        silent = true,
        noremap = true,
        mode = "n",
    }
)


-- VISUAL MODE
wk.register(
    {
        ["/"] = { "<cmd>norm gcc<cr>", "Comment" },
    },

    {
        prefix = "<leader>",
        silent = true,
        noremap = true,
        mode = "v",
    }
)