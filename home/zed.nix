{
  lib,
  ...
}: let
  themeDirectory = ./zed/themes;
  themes = lib.filterAttrs (_: type: type == "regular") (builtins.readDir themeDirectory);
in {
  home.activation.removeExistingZedFiles = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.config/zed/settings.json
    ${lib.concatMapStringsSep "\n" (name: "rm -f ~/.config/zed/themes/${lib.escapeShellArg name}") (builtins.attrNames themes)}
  '';

  xdg.configFile =
    {
      "zed/settings.json".source = ./zed/settings.json;
    }
    // lib.mapAttrs' (name: _: lib.nameValuePair "zed/themes/${name}" {
      source = themeDirectory + "/${name}";
    })
    themes;
}
