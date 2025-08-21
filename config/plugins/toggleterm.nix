{ config, lib, ... }:
{
  plugins.toggleterm = {
    enable = true;

    lazyLoad = {
      settings = {
        cmd = "ToggleTerm";
        keys = [
          "<leader>tg"
          "<leader>gg"
        ];
      };
    };

    settings = {
      # direction = "float";

      start_in_insert = true;
      persist_mode = false;

      close_on_exit = true;
    };
  };

  keymaps = lib.mkIf config.plugins.toggleterm.enable [
    {
      mode = [
        "n"
        "t"
        "i"
      ];
      key = "<C-/>";
      action = "<cmd>ToggleTerm<CR>";
      options = {
        desc = "Open Terminal";
      };
    }
  ];
}
