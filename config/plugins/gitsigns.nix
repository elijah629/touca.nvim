{
  plugins.gitsigns = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPre"
      "BufNewFile"
    ];

    settings = {
      current_line_blame = false;
    };
  };
}
