{pkgs, ...}: {
  home.packages = with pkgs; [
    ansible # Radically simple IT automation
    asdf-vm # Extendable version manager with support for Ruby, Node.js, Erlang & more
    (aspellWithDicts (dicts: with dicts; [ en ])) # Spell checker with English dictionaries
    croc # Easily and securely send things from one computer to another 🐊 📦
    fd # A simple, fast and user-friendly alternative to 'find'
    ffmpeg # Complete, cross-platform solution to record, convert and stream audio and video
    fluxcd # Open and extensible continuous delivery solution for Kubernetes
    grex # A command-line tool and Rust library with Python bindings for generating regular expressions from user-provided test cases
    gh # github cli
    jq # A lightweight and flexible command-line JSON processor
    kubernetes-helm # Package manager for kubernetes
    kustomize # Customization of kubernetes YAML configurations
    libmediainfo # Shared library for mediainfo
    libyaml # YAML 1.1 parser and emitter written in C
    oath-toolkit # Components for building one-time password authentication systems
    ripgrep # Recursively searches directories for a regex pattern
    talosctl # CLI for out-of-band management of Kubernetes nodes created by Talos
    terraform # Tool for building, changing, and versioning infrastructure
  ];

  programs = {
    # bun = {
    #   enable = true;
    # };

    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
      colors = "auto";
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    gallery-dl = {
      enable = true;
    };

    rclone = {
      enable = true;
    };

    # terminal file manager
    yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "y";
      settings = {
        manager = {
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };

    uv = {
      enable = true;
    };

    yt-dlp = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
  };
}
