{ pkgs, ... }:
{
  imports = [
    ./plugins
    ./settings.nix
    ./keybinds.nix
  ];

  extraPackages = with pkgs; [
    ripgrep
  ];
}
