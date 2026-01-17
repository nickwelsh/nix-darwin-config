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
      "nickwelsh/tap"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      "asdf"
      "aspell"
      "ffmpeg"
      "gemini-cli"
      "libyaml"
      "mediainfo"
      "python@3.14"
      "withgraphite/tap/graphite"
      "yt-dlp"
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "1password"
      "adguard"
      "appcleaner"
      "audacity"
      "audio-hijack"
      "autodesk-fusion"
      "bambu-studio"
      "codex"
      "crossover"
      "cursor"
      "discord"
      "ea"
      "firefox"
      "helium-browser"
      "herd"
      "iina"
      "imageoptim"
      "jetbrains-toolbox"
      "kaleidoscope"
      "karabiner-elements"
      "keka"
      "kekaexternalhelper"
      "keyboard-maestro"
      "linear-linear"
      "little-snitch"
      "loopback"
      "modrinth"
      "native-access"
      "notion"
      "notion-calendar"
      "notion-mail"
      "orbstack"
      "protonvpn"
      "rapidapi"
      "raycast"
      "setapp"
      "sf-symbols"
      "shapr3d"
      "sketch"
      "soundsource"
      "steam"
      "steinberg-activation-manager"
      "steinberg-download-assistant"
      "sublime-merge"
      "sublime-text"
      "tailscale-app"
      "transmission"
      "transmit"
      "ungoogled-chromium"
      "vlc"
      "warp"

      "nickwelsh/tap/arctic"
      "nickwelsh/tap/offshoot"
      "nickwelsh/tap/parashoot"
      "nickwelsh/tap/postlab"
    ]
    ++ pkgs.lib.optionals pkgs.stdenv.isAarch64 [
      "chatgpt"
    ];
  };
}
