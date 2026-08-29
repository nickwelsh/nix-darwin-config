{ pkgs, ... }:
{
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    git
  ];
  environment.variables.EDITOR = "subl";

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
      extraFlags = [ "--force-cleanup" ];
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas
    # masApps = {
    #   Drafts = 1435957248;
    #   FinalCutPro = 424389933;
    #   Infuse = 1136220934;
    #   LogicPro = 634148309;
    #   Peek = 1554235898;
    #   Things3 = 904280696;
    #   Xcode = 497799835;
    # };

    taps = [
      {
        name = "controlplaneio-fluxcd/tap";
        trusted = true;
      }
      {
        name = "nickwelsh/tap";
        trusted = true;
      }
      {
        name = "schpet/tap";
        trusted = true;
      }
      {
        name = "withgraphite/tap";
        trusted = true;
      }
      {
        name = "xykong/tap";
        trusted = true;
      }
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      # Agentic GitOps within Claude, Cursor, or other MCP-compatible tools
      "flux-operator-mcp"
      # Interpreted, interactive, object-oriented programming language
      "python@3.14"
      "python@3.13"
      # Unified display of technical and tag data for audio/video
      "media-info"
      # a cli to list, start and create issues in the linear issue tracker
      "schpet/tap/linear"
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      # Password manager that keeps all passwords secure behind one password
      # "1password"
      # Command-line interface for 1Password
      # "1password-cli"
      # Stand alone ad blocker
      "adguard"
      # Temporary notes with calculations and extensible features
      "antinote"
      # Application uninstaller
      "appcleaner"
      # Chromium based browser
      "arc"
      # The ultimate Final Cut Pro library cleaner. Find caches, helper files, and non-original media, whether they are on connected drives or in a cupboard, and reclaim all that disk space you so sorely need.
      "nickwelsh/tap/arctic"
      # Multi-track audio editor and recorder
      # "audacity"
      # Records audio from any application
      "audio-hijack"
      # Integrated CAD, CAM, CAE, and PCB software
      "autodesk-fusion"
      # 3D model slicing software for 3D printers, maintained by Bambu Lab
      "bambu-studio"
      # Web browser focusing on privacy
      # "brave-browser"
      # OpenAI's official ChatGPT desktop app
      # "chatgpt"
      # OpenAI's coding agent that runs in your terminal
      # "codex"
      # OpenAI's Codex desktop app for managing coding agents
      # "codex-app"
      # Tool to run Windows software
      # "crossover"
      # Write, edit, and chat about your code with AI
      # "cursor"
      # Voice and text chat software
      # "discord"
      # Window peeking utility app
      "dockdoor"
      # Dock utility
      # "dockside"
      # Electronic Arts game launcher
      # "ea"
      # Web browser
      # "firefox"
      # Web browser
      # "firefox@developer-edition"
      # Web browser
      # "firefox@nightly"
      # Beautiful Markdown previews in macOS Finder QuickLook
      "xykong/tap/flux-markdown"
      # Git client for simultaneous branches on top of your existing workflow
      # "gitbutler"
      # Web browser
      # "google-chrome"
      # Web browser
      # "google-chrome@beta"
      # Web browser
      # "google-chrome@canary"
      # Web browser
      # "google-chrome@dev"
      # Chromium-based web browser
      "helium-browser"
      # Laravel and PHP development environment manager
      "herd"
      # Free and open-source media player
      # "iina"
      # Tool to optimise images to a smaller size
      "imageoptim"
      # JetBrains tools manager
      # "jetbrains-toolbox"
      # Spot and merge differences in text and image files or folders
      "kaleidoscope"
      # Keyboard customiser
      # "karabiner-elements"
      # File archiver
      # "keka"
      # Helper application for the Keka file archiver
      "kekaexternalhelper"
      # Automation software
      # "keyboard-maestro"
      # App to manage software development and track bugs
      # "linear"
      # Host-based application firewall
      "little-snitch"
      # Discover, download, and run local LLMs
      # "lm-studio"
      # Cable-free audio router
      # "loopback"
      # Provides updates to various Microsoft products
      # "microsoft-auto-update"
      # Multi-platform web browser
      # "microsoft-edge"
      # Multi-platform web browser
      # "microsoft-edge@beta"
      # Multi-platform web browser
      # "microsoft-edge@canary"
      # Multi-platform web browser
      # "microsoft-edge@dev"
      # Spreadsheet software
      # "microsoft-excel"
      # Presentation software
      # "microsoft-powerpoint"
      # Word processor
      # "microsoft-word"
      # Minecraft modding platform
      # "modrinth"
      # AI voice dictation that adapts to your writing style
      # "monologue"
      # Administration tool for Native Instruments products
      # "native-access"
      # Reverse proxy, secure introspectable tunnels to localhost
      # "ngrok"
      # App to write, plan, collaborate, and get organised
      # "notion"
      # Calendar for professionals and teams
      # "notion-calendar"
      # Email client integrated with Notion workspace
      # "notion-mail"
      # Knowledge base that works on top of a local folder of plain text Markdown files
      # "obsidian"
      # Fast, verified data transfers with metadata management for offload and ingest. Formerly known as Hedge, OffShoot is your ideal companion when managing media.
      # "nickwelsh/tap/offshoot"
      # Organise all your reference images in one place
      "ogdesign-eagle"
      # Cloud storage client
      # "onedrive"
      # AI usage tracker for Cursor, Claude Code, Codex, Copilot and more
      # "openusage"
      # Web browser
      # "opera"
      # Replacement for Docker Desktop
      # "orbstack"
      # WebKit based web browser
      "orion"
      # The safe memory card eraser
      # "nickwelsh/tap/parashoot"
      # The highly anticipated successor to Postlab Classic! Get your whole creative team on the same page, managing projects and versioning on any system, anywhere you are.
      # "nickwelsh/tap/postlab"
      # VPN client focusing on security
      # "protonvpn"
      # HTTP client that helps testing and describing APIs
      "rapidapi"
      # Control your tools with a few keystrokes
      # "raycast"
      # Collection of apps available by subscription
      "setapp"
      # Tool that provides consistent, highly configurable symbols for apps
      "sf-symbols"
      # 3D CAD software
      # "shapr3d"
      # Digital design and prototyping platform
      "sketch"
      # Sound and audio controller
      # "soundsource"
      # Video game digital distribution service
      # "steam"
      # Licenses manager for Steinberg Licensing
      # "steinberg-activation-manager"
      # Tool to download files for Steinberg products
      # "steinberg-download-assistant"
      # Git client
      # "sublime-merge"
      # Text editor for code, markup and prose
      # "sublime-text"
      # Mesh VPN based on WireGuard
      # "tailscale-app"
      # Web browser
      # "thebrowsercompany-dia"
      # Open-source BitTorrent client
      # "transmission"
      # File transfer application
      "transmit"
      # Google Chromium, sans integration with Google
      # "ungoogled-chromium"
      # Web browser with built-in email client focusing on customization and control
      # "vivaldi"
      # Multimedia player
      "vlc"
      # Rust-based terminal
      # "warp"
      # Multiplayer code editor
      # "zed"
      # Gecko based web browser
      # "zen"
    ];
  };
}
