{ username, ... }:

{
  # import sub modules
  imports = [
    ./shell.nix
    ./core.nix
    ./git.nix
    ./starship.nix
    ./karabiner.nix
    ./zed.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";
  };

  # GUI packages in home.packages are per-user applications. Link their app
  # bundles under ~/Applications/Home Manager Apps; /Applications/Nix Apps is
  # reserved for GUI packages installed through environment.systemPackages.
  targets.darwin.linkApps.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
