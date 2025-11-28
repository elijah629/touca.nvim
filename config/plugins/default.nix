{
  imports = [
    ./tokyonight.nix

    ./blink-cmp.nix

    ./mini.nix

    ./toggleterm.nix
    ./neo-tree.nix
    ./noice.nix

    ./wakatime.nix

   # ./lualine.nix
    ./bufferline.nix

    ./which-key.nix

    # LSP and language specific config
    ./lang
    ./lspsaga.nix
    ./lsp.nix
    ./conform.nix
    ./treesitter.nix

    ./telescope.nix
    ./alpha.nix
    ./fidget.nix

    ./gitsigns.nix

    ./ufo.nix

    # Lazy loading support
    ./lz-n.nix
  ];
}
