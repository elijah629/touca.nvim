{ pkgs, ... }:
{
  plugins = {
    telescope = {
      enable = true;

      extensions = {
        fzf-native.enable = true;
      };

      keymaps = {
        "<leader>ft" = {
          action = "todo-comments";
          options.desc = "View Todo";
        };
        "<leader><space>" = {
          action = "find_files hidden=true";
          options.desc = "Find project files";
        };
        "<leader>ff" = {
          action = "live_grep";
          options.desc = "Grep (root dir)";
        };
        "<leader>f:" = {
          action = "command_history";
          options.desc = "View Command History";
        };
        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "View Recent files";
        };
        "<c-p>" = {
          mode = [
            "n"
            "i"
          ];
          action = "registers";
          options.desc = "Select register to paste";
        };
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "commits";
        };
        "<leader>fa" = {
          action = "autocommands";
          options.desc = "Auto Commands";
        };
        "<leader>fc" = {
          action = "commands";
          options.desc = "View Commands";
        };
        "<leader>fd" = {
          action = "diagnostics bufnr=0";
          options.desc = "View Workspace diagnostics";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "View Help pages";
        };
        "<leader>fk" = {
          action = "keymaps";
          options.desc = "View Key maps";
        };
        "<leader>fm" = {
          action = "man_pages";
          options.desc = "View Man pages";
        };
        "<leader>f'" = {
          action = "marks";
          options.desc = "View Marks";
        };
        "<leader>fo" = {
          action = "vim_options";
          options.desc = "View Options";
        };
        "<leader>uC" = {
          action = "colorscheme";
          options.desc = "Colorscheme preview";
        };
      };
    };
  };

  extraPackages = with pkgs; [
    fzf
    fd
  ];
}
