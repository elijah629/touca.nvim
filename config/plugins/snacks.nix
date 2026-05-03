{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    imagemagick
  ];

  plugins.snacks = {
    enable = true;

    settings = {
      bigfile.enabled = false;
      notifier.enabled = false;
      quickfile.enabled = false;
      statuscolumn.enabled = false;
      words.enabled = false;

      image = {
        enabled = true;
        doc = {
          enabled = true;
          inline = true;
          float = true;
        };
      };
    };
  };
}
