{pkgs, inputs, ...}: let
  # Warp's DMG uses APFS, which the stable nixpkgs `undmg` unpacker cannot
  # handle. The unstable package uses the newer 7-Zip-based unpacker.
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
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
    _1password-gui # Multi-platform password manager
    _1password-cli # 1Password command-line tool
    audacity # Sound editor with graphical UI
    chatgpt # Desktop application for ChatGPT
    codex # Lightweight coding agent that runs in your terminal
    discord # All-in-one cross-platform voice and text chat for gamers
    firefox # Web browser built from Firefox source tree
    glow # Render markdown on the CLI, with pizzazz
    iina # Modern media player for macOS
    jetbrains-toolbox # JetBrains Toolbox
    karabiner-elements # Powerful utility for keyboard customization on macOS Ventura (13) or later
    keka # macOS file archiver
    linear # App to manage software development and track bugs
    orbstack # Fast, light, and easy way to run Docker containers and Linux machines
    rapidapi # Full-featured HTTP client that lets you test and describe the APIs you build or consume
    raycast # Control your tools with a few keystrokes
    soundsource # Sound controller for macOS
    tailscale-gui # Tailscale GUI client for macOS
    pkgsUnstable.warp-terminal # Rust-based terminal
    zed-editor # High-performance, multiplayer code editor from the creators of Atom and Tree-sitter.
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
