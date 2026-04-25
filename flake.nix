{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixvim,
      nixpkgs,
      flake-utils,
      self,
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        nixvimLib = nixvim.lib.${system};
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          # FIXME: Remove once nixvim is patched
          overlays = [
            (_final: prev: {
              # nixvim's generated config is installed through Neovim's plugin
              # pack, whose current nixpkgs implementation expects a pname.
              runCommandLocal =
                name: args: script:
                let
                  drv = prev.runCommandLocal name args script;
                in
                if name == "nvim-config" then drv // { pname = name; } else drv;
            })
          ];
        };
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;

          extraSpecialArgs = {
            inherit inputs self;
          }
          // import ./lib;
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in
      {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages.default = nvim;
      }
    );
}
