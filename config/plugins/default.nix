{
  imports = [
    # Lazy loading provider
    ./lz-n.nix

    # Theme and startup UI
    ./tokyonight.nix
    ./alpha.nix

    # Core editing experience
    ./blink-cmp.nix
    ./mini.nix
    ./bufferline.nix
    ./conform.nix
    ./fidget.nix
    ./gitsigns.nix
    ./lsp.nix
    ./lspsaga.nix
    ./lualine.nix
    ./neo-tree.nix
    ./noice.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
    ./ufo.nix
    ./which-key.nix

    # LSP and language specific config
    ./lang

    # External services
    ./wakatime.nix
  ];
}
