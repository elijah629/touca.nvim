{ icons, lib, ... }:
{
  autoCmd = [
    {
      event = "VimEnter";
      desc = "Open neo-tree on startup when no file arguments were provided";
      callback = lib.nixvim.mkRaw ''
        function()
          if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
            vim.cmd("Neotree show")
          end
        end
      '';
    }
  ];

  plugins.neo-tree = {
    enable = true;
    lazyLoad.settings.cmd = "Neotree";

    settings = {
      close_if_last_window = true;

      sources = [
        "filesystem"
        "buffers"
        "git_status"
        "document_symbols"
      ];

      popup_border_style = "rounded"; # “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code

      filesystem = {
        bind_to_cwd = false;
        use_libuv_file_watcher = true;
        follow_current_file.enabled = true;

        filtered_items = {
          visible = true;
          hide_dotfiles = true;
          hide_gitignored = true;
          never_show = [ ];
        };
      };

      default_component_configs = {
        git_status = {
          symbols = {
            added = icons.git.LineAdded;
            conflict = icons.git.FileConflict;
            deleted = icons.git.FileDeleted;
            ignored = icons.git.FileIgnored;
            modified = icons.git.LineModified;
            renamed = icons.git.FileRenamed;
            staged = icons.git.FileStaged;
            unstaged = icons.git.FileUnstaged;
            untracked = icons.git.FileUntracked;
          };
        };
      };
    };
  };

  /*
    keymaps = [
      {
        mode = "n";
        key = "<leader>E";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (root dir)";
        };
      }
    ];
  */
}
