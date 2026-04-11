{ pkgs, inputs, ... }:
let
  pkgsUnstable = import inputs.nixpkgs-unstable { system = pkgs.system; };
in
{
  home.packages = [
    pkgsUnstable.bun
  ];
}