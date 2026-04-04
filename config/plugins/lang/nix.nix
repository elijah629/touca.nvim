{
  self,
  pkgs,
  lib,
  ...
}:
{
  plugins = {
    nix = {
      enable = true;
      lazyLoad.settings.ft = "nix";
    };

    hmts = {
      enable = true;
      lazyLoad.settings.ft = "nix";
    };

    nix-develop = {
      enable = true;
      lazyLoad.settings.ft = "nix";
    };

    conform-nvim.settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
      };

      formatters = {
        nixfmt.command = lib.getExe pkgs.nixfmt;
      };
    };

    lint = {
      lintersByFt = {
        nix = [ "statix" ];
      };

      linters = {
        statix.cmd = lib.getExe pkgs.statix;
      };
    };

    lsp.servers.nixd = {
      enable = true;
      settings =
        let
          flake = ''(builtins.getFlake "${self}")'';
          system = "\${builtins.currentSystem}";
        in
        {
          formatting = {
            command = [ "${lib.getExe pkgs.nixfmt}" ];
          };
          nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
          options = {
            nixvim.expr = "${flake}.packages.${system}.nvim.options";
          };
        };
    };
  };
}
