{
  globals.mapleader = " ";

  keymaps = [
       {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m .-2<cr>==";
      options.desc = "Move line up";
    }

    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<cr>gv=gv";
      options.desc = "Move line up";
    }

    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m .+1<cr>==";
      options.desc = "Move line down";
    }

    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<cr>gv=gv";
      options.desc = "Move line Down";
    }
  ];
}
