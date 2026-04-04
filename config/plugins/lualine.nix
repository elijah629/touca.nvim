{
  plugins.lualine = {
    enable = true;

    lazyLoad.settings.event = [
      "VimEnter"
      "BufReadPost"
      "BufNewFile"
    ];

    settings = {
      options = {
        disabled_filetypes = {
          statusline = [
            "alpha"
            "dashboard"
            "neo-tree"
          ];
          winbar = [
            "alpha"
            "dashboard"
            "neo-tree"
          ];
        };
        globalstatus = true;
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          "diff"
          "diagnostics"
        ];
        lualine_c = [ "filename" ];
        lualine_x = [
          "encoding"
          "fileformat"
          "filetype"
        ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
