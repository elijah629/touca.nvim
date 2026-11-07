{
  lib,
  pkgs,
  ...
}:
{
  extraPackages = with pkgs; [
    marksman
  ];

  plugins = {
    clipboard-image = {
      enable = true;
      clipboardPackage = pkgs.wl-clipboard;
      lazyLoad.settings.ft = "markdown";
    };

    markdown-preview = {
      enable = true;
      lazyLoad.settings.ft = "markdown";
    };

    conform-nvim.settings = {
      formatters_by_ft.markdown = [ "deno_fmt" ];

      formatters = {
        deno_fmt.command = lib.getExe pkgs.deno;
      };
    };

    lsp.servers = {
      marksman.enable = true;

      ltex_plus = {
        enable = true;
        package = pkgs.ltex-ls-plus;
        filetypes = [
          "markdown"
          "text"
        ];

        settings.ltex.completionEnabled = true;

        extraOptions = {
          checkFrequency = "save";
          language = "en-GB";
        };
      };
    };

    lint = {
      lintersByFt.markdown = [ "markdownlint" ];
      linters.markdownlint.cmd = lib.getExe pkgs.markdownlint-cli;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>m";
      action = "<cmd>MarkdownPreviewToggle<cr>";
      options = {
        silent = true;
        desc = "Toggle markdown preview";
      };
    }
  ];
}
