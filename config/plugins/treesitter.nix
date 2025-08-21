{ pkgs, ... }:
{
  plugins = {
    treesitter = {
      enable = true;

      folding = true;

      nixvimInjections = true;

      settings = {
        incremental_selection.enable = true;
        indent.enable = true;

        highlight = {
          additional_vim_regex_highlighting = true;
          enable = true;
        };
      };
    };
  };

  extraPackages = with pkgs; [
    tree-sitter
  ];
}
