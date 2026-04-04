{
  plugins.which-key = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";

    settings = {
      delay = 200;
      icons = {
        breadcrumb = "»";
        group = "+";
        separator = ""; # ➜
      };
      preset = "helix";
      spec = [
        {
          __unkeyed-1 = "<leader>c";
          group = "code";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "find";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "git";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "lsp";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>m";
          group = "markdown";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "terminal";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>u";
          group = "ui";
          mode = "n";
        }
      ];
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
