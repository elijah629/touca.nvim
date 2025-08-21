{
  plugins.blink-cmp = {
    enable = true;

    #lazyLoad.settings.event = [
    #  "InsertEnter"
    #  "CmdlineEnter"
    #];

    settings = {
      cmdline = {
        completion = {
          list.selection = {
            preselect = false;
          };
          menu.auto_show = true;
        };
        keymap = {
          preset = "enter";
          "<CR>" = [
            "accept_and_enter"
            "fallback"
          ];
        };
      };

      completion = {
        accept.auto_brackets.enabled = true;
        ghost_text.enabled = true;

        documentation = {
          auto_show = true;
          window.border = "rounded";
        };

        list.selection = {
          auto_insert = false;
          preselect = false;
        };

        menu = {
          border = "rounded";

          draw = {
            columns = [
              {
                __unkeyed-1 = "label";
              }
              {
                __unkeyed-1 = "kind_icon";
                __unkeyed-2 = "kind";
                gap = 1;
              }
              { __unkeyed-1 = "source_name"; }
            ];

            components = {
              kind_icon = {
                text.__raw = ''
                  function(ctx)
                    local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                    -- Check for both nil and the default fallback icon
                    if not kind_icon or kind_icon == '󰞋' then
                      -- Use our configured kind_icons
                      return require('blink.cmp.config').appearance.kind_icons[ctx.kind] or ""
                    end
                    return kind_icon
                  end
                '';
                highlight.__raw = ''
                  function(ctx)
                    local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                    return hl
                  end
                '';
              };

              kind = {
                highlight.__raw = ''
                  function(ctx)
                    local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                    return hl
                  end
                '';
              };
            };
          };
        };
      };

      fuzzy = {
        implementation = "rust";
        prebuilt_binaries = {
          download = false;
        };
      };

      keymap = {
        preset = "enter";
      };

      signature = {
        enabled = true;
        window.border = "rounded";
      };

      # snippets.preset = "mini_snippets";
    };
  };
}
