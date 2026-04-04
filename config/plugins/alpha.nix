{
  plugins = {
    alpha = {
      enable = true;
      settings.layout =
        let
          padding = val: {
            type = "padding";
            inherit val;
          };
          button =
            shortcut: label: command:
            {
              type = "button";
              val = label;
              on_press.__raw = "function() vim.cmd([[${command}]]) end";
              opts = {
                keymap = [
                  "n"
                  shortcut
                  "<cmd>${command}<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                inherit shortcut;
                position = "center";
                cursor = 3;
                width = 42;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            };
        in
        [
          (padding 4)
          {
            opts = {
              hl = "AlphaHeader";
              position = "center";
            };
            type = "text";
            val = [
              "░░░░░░░░▄▄▄▀▀▀▄▄███▄░░░░░░░░░░░░░░"
              "░░░░░▄▀▀░░░░░░░▐░▀██▌░░░░░░░░░░░░░"
              "░░░▄▀░░░░▄▄███░▌▀▀░▀█░░░░░░░░░░░░░"
              "░░▄█░░▄▀▀▒▒▒▒▒▄▐░░░░█▌░░░░░░░░░░░░"
              "░▐█▀▄▀▄▄▄▄▀▀▀▀▌░░░░░▐█▄░░░░░░░░░░░"
              "░▌▄▄▀▀░░░░░░░░▌░░░░▄███████▄░░░░░░"
              "░░░░░░░░░░░░░▐░░░░▐███████████▄░░░"
              "░░░░░le░░░░░░░▐░░░░▐█████████████▄"
              "░░░░toucan░░░░░░▀▄░░░▐█████████████▄ "
              "░░░░░░has░░░░░░░░▀▄▄███████████████ "
              "░░░░░arrived░░░░░░░░░░░░█▀██████░░"
            ];
          }
          (padding 2)
          {
            opts = {
              hl = "Comment";
              position = "center";
            };
            type = "text";
            val = "search, edit, and get out of the way";
          }
          (padding 4)
          (button "f" "  Find File" "Telescope find_files")
          (padding 1)
          (button "e" "  File Explorer" "Neotree show")
          (padding 1)
          (button "n" "  New File" "ene | startinsert")
          (padding 1)
          (button "r" "  Recent Files" "Telescope oldfiles")
          (padding 1)
          (button "g" "  Find Text" "Telescope live_grep")
          (padding 1)
          (button "s" "  Restore Session" "lua require('persistence').load()")
          (padding 1)
          (button "q" "  Quit Neovim" "qa")
          (padding 3)
          {
            opts = {
              hl = "Comment";
              position = "center";
            };
            type = "text";
            val = "leader is <Space>";
          }
        ];
    };

    persistence = {
      enable = true;
      settings.need = 0;
    };
  };
}
