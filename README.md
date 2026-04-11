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
0. Run `post-install.zsh`
1. Install bun `curl -fsSL https://bun.com/install | bash`
2. Log into 1Password
3. Launch and config Karabiner Elements
4. Launch and sign into Raycast, and enable sync
5. Launch and sign into Setpp
6. Configure Setapp
7. Install and configure apps from Setapp
8. Launch, configure, and activate AdGuard
9. Launch, configure, and activate Herd
10.Install PHP + NVM via Herd 
11. Install Redis, Postgres, and Min.io via Herd
12. Launch and sign into JetBrains Toolbox
13. Install PHPStorm via JetBrains Toolbox
14. Launch PHPStorm, import config, enable sync