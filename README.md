# Nix Darwin
1. Sign into iCloud/App Store
2. Install [Homebrew](https://brew.sh)
3. Install [Nix: the package manager](https://nixos.org/download/)
4. Update System and Hostname in `flake.nix`
5. Set your hostname `export HOSTNAME=Nicks-MacBook-Pro`
6. Build with `nix build ".#darwinConfigurations.$HOSTNAME.system" --extra-experimental-features 'nix-command flakes'`
7. Switch with `sudo -E ./result/sw/bin/darwin-rebuild switch --flake .#$HOSTNAME`
8. Restart `sudo shutdown -r now`

## Troubbleshooting
- bashrc/zshrc alreay exist
```bash
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin
sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
```

## Post install
1. Log into 1Password
2. Launch and config Karabiner Elements
3. Launch and sign into Raycast, and enable sync
4. Launch and sign into Setpp
5. Configure Setapp
6. Install Swish & Downie from Setapp
7. Launch and configure Swish
8. Launch and configure Downie
9. Launch, configure, and activate AdGuard
10. Launch, configure, and activate Herd
11. Install PHP + NVM via Herd
12. Install Redis, Postgres, and Min.io via Herd
13. Launch and sign into JetBrains Toolbox
14. Install PHPStorm via JetBrains Toolbox
15. Launch PHPStorm, import config, enable sync