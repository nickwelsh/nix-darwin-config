{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep # Recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    fd # A simple, fast and user-friendly alternative to 'find'
    croc # Easily and securely send things from one computer to another 🐊 📦
    grex # A command-line tool and Rust library with Python bindings for generating regular expressions from user-provided test cases
    ffmpeg # Complete, cross-platform solution to record, convert and stream audio and video
    gh # github cli
  ];

  programs = {
    bun = {
      enable = true;
    };

    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
      colors = "auto";
    };

    # terminal file manager
    yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
  };
}
