{ icons, ... }:
{
  config = {
    extraConfigLuaPre = ''
      vim.fn.sign_define("DiagnosticSignError", { text = "${icons.diagnostics.BoldError}", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = "${icons.diagnostics.BoldWarning}", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "${icons.diagnostics.BoldHint}", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = "${icons.diagnostics.BoldInformation}", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
    '';

    # feature that enhances the way Neovim loads and executes Lua modules,
    # offering improved performance and flexibility.
    luaLoader.enable = true;

    clipboard.providers.wl-copy.enable = true;

    diagnostic.settings = {
      virtual_text = false;
      virtual_lines = {
        only_current_line = false;
      };
    };

    opts = {
      # virtualedit = "block"; # Allow cursor to move where there is no text in visual block mode

      cursorline = true; # Highlight the line where the cursor is located
      cmdheight = 2; # more space in the neovim command line for displaying messages
      # showmode = false; # Dont show the editor mode in status line

      # Enable relative line numbers
      number = true;
      relativenumber = true;

      clipboard = "unnamedplus";

      spell = false;

      # Tab spacing 2 spaces
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      showtabline = 2;
      expandtab = true;

      smartindent = true;
      wrap = true;

      # Smart indent on word wrap
      breakindent = true;

      # Undo stuff from days ago
      swapfile = false;
      backup = false;
      undofile = true;

      # Incremental search
      hlsearch = true;
      incsearch = true;

      # Better splitting
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;

      # Enable ignorecase + smartcase for better searching
      ignorecase = true;
      smartcase = true; # Don't ignore case with capitals
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";

      # Better colors
      termguicolors = true;

      # Decrease updatetime
      updatetime = 50; # faster completion (4000ms default)

      # Enable the sign column to prevent the screen from jumping
      signcolumn = "yes";

      # Reduce which-key timeout to 250ms
      timeoutlen = 250;

      scrolloff = 8; # Will never have less than 8 characters as you scroll down
      mouse = "a"; # Mouse

      # Set encoding type
      encoding = "utf-8";
      fileencoding = "utf-8";

      # Maximum number of items to show in the popup menu (0 means "use available screen space")
      pumheight = 0;
    };
  };
}
