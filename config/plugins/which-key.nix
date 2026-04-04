{
  plugins.which-key = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";

    settings = {
      icons = {
        breadcrumb = "»";
        group = "+";
        separator = ""; # ➜
      };
      win = {
        border = "rounded";
        padding = [
          1
          1
        ];
      };
    };
  };
}
