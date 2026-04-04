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

    image = {
      enable = lib.nixvim.enableExceptInTests;
      lazyLoad.settings.ft = "markdown";
      settings = {
        integrations.markdown = {
          clearInInsertMode = true;
          onlyRenderImageAtCursor = true;
        };
      };
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

      ltex = {
        enable = true;
        filetypes = [
          "markdown"
          "text"
        ];

        settings.completionEnabled = true;

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
