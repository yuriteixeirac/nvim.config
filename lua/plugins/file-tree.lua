return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    cmd = "Neotree",
    keys = {
	{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" }
    },
    lazy = false, -- neo-tree will lazily load itself

    opts = {
    filesystem = {
      follow_current_file = { enabled = true }, -- destaca o arquivo atual na árvore
      filtered_items = {
        visible = false,       -- true = mostra ocultos/gitignored por padrão
        hide_dotfiles = false, -- false = mostra arquivos com "."
        hide_gitignored = true,
      },
    },

    window = {
      width = 30,
      mappings = {
        ["<space>"] = "none", -- evita conflito se seu leader for space
      },
    },

    default_component_configs = {
      indent = { with_expanders = true }, -- setinhas de expandir/colapsar
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
  },
  }
}
