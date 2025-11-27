# Nix Darwin
1. Sign into iCloud/App Store
2. Grant Full Disk Access to Terminal.app
3. Install [Homebrew](https://brew.sh)
4. Install [Nix: the package manager](https://nixos.org/download/)
5. Update System and Hostname in `flake.nix`
6. Set your hostname `export HOSTNAME=Nicks-MacBook-Pro`
7. Build with `nix build ".#darwinConfigurations.$HOSTNAME.system" --extra-experimental-features 'nix-command flakes'`
8. Switch with `sudo -E ./result/sw/bin/darwin-rebuild switch --flake .#$HOSTNAME`
9. Restart `sudo shutdown -r now`

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
6. Install and configure apps from Setapp
7. Launch, configure, and activate AdGuard
8. Launch, configure, and activate Herd
9. Install PHP + NVM via Herd
10. Install Redis, Postgres, and Min.io via Herd
11. Launch and sign into JetBrains Toolbox
12. Install PHPStorm via JetBrains Toolbox
13. Launch PHPStorm, import config, enable sync
14. Run `post-install.zsh`