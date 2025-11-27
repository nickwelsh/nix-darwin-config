{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$HOME/Library/Application Support/Herd/bin"

      # Automatically switch to the correct node version when changing directories
      [[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

      # Herd injected NVM configuration
      export NVM_DIR="/Users/nick/Library/Application Support/Herd/config/nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

      # Herd injected PHP binary.
      export PATH="/Users/nick/Library/Application Support/Herd/bin/":$PATH

      # Herd injected PHP 8.3 configuration.
      export HERD_PHP_83_INI_SCAN_DIR="/Users/nick/Library/Application Support/Herd/config/php/83/"

      # Herd injected PHP 8.4 configuration.
      export HERD_PHP_84_INI_SCAN_DIR="/Users/nick/Library/Application Support/Herd/config/php/84/"

      # Herd injected PHP 8.5 configuration.
      export HERD_PHP_85_INI_SCAN_DIR="/Users/nick/Library/Application Support/Herd/config/php/85/"
    '';
  };

  home.shellAliases = {
    pa = "php artisan";
    pamfs = "php artisan migrate:fresh --seed";
  };
}
