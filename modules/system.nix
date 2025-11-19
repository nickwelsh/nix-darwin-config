{ pkgs, ... }:

  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #  Incomplete list of macOS `defaults` commands :
  #    https://github.com/yannbertrand/macos-defaults
  #
{
  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 6;

    defaults = {
     ".GlobalPreferences" = {
        # Pointer speeds:
        #
        # Mouse: slider internally is 0.0–3.0. 3.0 ≈ very max; steps are 0.5. 
        # 8/10 ≈ 2.5 here.
        "com.apple.mouse.scaling" = 2.5;
      };

      # menuExtraClock.Show24Hour = true;  # show 24 hour clock
      controlcenter = {
        AirDrop = false;
        BatteryShowPercentage = true;
        Bluetooth = false;
        Display = false;
        FocusModes = false;
        NowPlaying = false;
        Sound = false;
      };
      
      # customize dock
      dock = {
        # Dock behaviour
        autohide = true;                     # auto-hide Dock
        show-recents = false;                # no recent apps section 
        static-only = true;                  # show only open apps (Finder is always there) 
        persistent-apps = [ ];               # no pinned apps beyond Finder

        # Minimize behaviour
        mineffect = "suck";                  # genie/scale/suck 
        minimize-to-application = true;      # minimize into app icon 

        # Stacks / visual tweaks
        mouse-over-hilite-stack = true;      # highlight grid stack on hover 
        showhidden = true;                   # hidden apps appear translucent 

        mru-spaces = false;              # disable “Automatically rearrange Spaces…” 

        # Not ready yet, see CustomUserPreferences."com.apple.dock" for now
        # Trackpad / gesture hooks (Desktop & Dock > Mission Control section)
        # showMissionControlGestureEnabled = true;  # 3/4-finger swipe up → Mission Control 
        # showAppExposeGestureEnabled = true;       # 3/4-finger swipe down → App Exposé
        # showDesktopGestureEnabled = true;         # 4-finger spread → Desktop 
        # showLaunchpadGestureEnabled = true;       # 4-finger pinch → Launchpad 
      };

      # customize finder
      finder = {
        AppleShowAllExtensions = true;  # show all file extensions
        AppleShowAllFiles = true; # show hidden files
        FXDefaultSearchScope = "SCcf"; # the default search scope. Use "SCcf" to default to current folder. The default is unset ("This Mac").
        FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
        FXPreferredViewStyle = "Nlsv"; # the default finder view. "icnv" = Icon view, "Nlsv" = List view, "clmv" = Column View, "Flwv" = Gallery View The default is icnv.
        NewWindowTarget = "Home"; #the default folder shown in Finder windows
        ShowExternalHardDrivesOnDesktop = false; # show external disks on desktop
        ShowHardDrivesOnDesktop = false; # show hard disks on desktop
        ShowMountedServersOnDesktop = false; # show connected servers on desktop
        ShowPathbar = true; # path breadcrumbs in finder windows
        ShowRemovableMediaOnDesktop = false; # show removable media (CDs, DVDs and iPods) on desktop
        ShowStatusBar = true;  # show status bar
      };

      # customize trackpad
      trackpad = {
        # Tracking / click feel
        #
        # ActuationStrength: 0 = light/silent, 1 = normal 
        # First/SecondClickThreshold: 0 = light, 1 = medium, 2 = firm.
        ActuationStrength = 0;        # light click
        FirstClickThreshold = 0;      # primary click = light
        SecondClickThreshold = 0;     # force click = light

        # ForceSuppressed = false;      # enable force click & haptics

        # Secondary click: click with two fingers
        TrackpadRightClick = true;    # enable two-finger secondary click 

        # Tap to click: OFF
        Clicking = false;             # tapping does nothing, you must click

        # Zoom / rotate / smart zoom
        # TrackpadPinch = true;                 # pinch to zoom
        # TrackpadRotate = true;                # two-finger rotate
        # TrackpadTwoFingerDoubleTapGesture = true;  # smart zoom on double-tap with two fingers 

        # Three-finger horizontal: switch full-screen apps
        #
        # TrackpadThreeFingerHorizSwipeGesture:
        #   0 = disabled, 1 = swipe between pages, 2 = swipe between full-screen apps. 
        # TrackpadThreeFingerHorizSwipeGesture = 2;

        TrackpadThreeFingerDrag = true;  # enable three finger drag
      };

      magicmouse.MouseButtonMode = "TwoButton";  # "TwoButton" = primary/secondary 

      # customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      #   https://github.com/yannbertrand/macos-defaults
      NSGlobalDomain = {
        # `defaults read NSGlobalDomain "xxx"`
        "com.apple.swipescrolldirection" = true;  # enable natural scrolling(default to true)
        "com.apple.sound.beep.feedback" = 0;  # disable beep sound when pressing volume up/down key
        AppleInterfaceStyle = "Dark";  # dark mode
        AppleKeyboardUIMode = 3;  # Mode 3 enables full keyboard control.
        ApplePressAndHoldEnabled = true;  # enable press and hold
        AppleICUForce24HourTime = true; # use a 24-hour time

        # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
        # This is very useful for vim users, they use `hjkl` to move cursor.
        # sets how long it takes before it starts repeating.
        InitialKeyRepeat = 15;  # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts. 
        KeyRepeat = 3;  # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false;  # disable auto capitalization
        NSAutomaticDashSubstitutionEnabled = false;  # disable auto dash substitution
        NSAutomaticPeriodSubstitutionEnabled = false;  # disable auto period substitution
        NSAutomaticQuoteSubstitutionEnabled = false;  # disable auto quote substitution
        NSAutomaticSpellingCorrectionEnabled = false;  # disable auto spelling correction
        NSNavPanelExpandedStateForSaveMode = true;  # expand save panel by default
        NSNavPanelExpandedStateForSaveMode2 = true;

        # Swipe between pages (two-finger / one-finger scroll left/right)
        AppleEnableSwipeNavigateWithScrolls = true;               # trackpad 
        AppleEnableMouseSwipeNavigateWithScrolls = true;          # Magic Mouse 

        # Trackpad: slider internally is 0.0–3.0. 3.0 ≈ very max; steps are 0.5.. 7/10 ≈ 2.0.
        "com.apple.trackpad.scaling" = 2.0;   
      };

      # Customize settings that not supported by nix-darwin directly
      # see the source code of this project to get more undocumented options:
      #    https://github.com/rgcr/m-cli
      # 
      # All custom entries can be found by running `defaults read` command.
      # or `defaults read xxx` to read a specific domain.
      CustomUserPreferences = {
        ".GlobalPreferences" = {
          # automatically switch to a new space when switching to the application
          AppleSpacesSwitchOnActivate = true;
        };
        NSGlobalDomain = {
          # Add a context menu item for showing the Web Inspector in web views
          WebKitDeveloperExtras = true;
        };
        "com.apple.universalaccess" = {
          closeViewScrollWheelToggle = true;  # enable “Use scroll gesture with modifier keys to zoom”
          HIDScrollZoomModifierMask = 262144; # 262144 = Control key
        };
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = true;
          ShowMountedServersOnDesktop = true;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = false;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.spaces" = {
          "spans-displays" = 0; # Display have seperate spaces
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 0; # Click wallpaper to reveal desktop
          StandardHideDesktopIcons = 0; # Show items on desktop
          HideDesktop = 0; # Do not hide items on desktop & stage manager
          StageManagerHideWidgets = 0;
          StandardHideWidgets = 0;
        };
        "com.apple.screensaver" = {
          # Require password immediately after sleep or screen saver begins
          askForPassword = 1;
          askForPasswordDelay = 0;
        };
        "com.apple.screencapture" = {
          location = "~/Desktop";
          type = "png";
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;

        # Magic Mouse gestures (com.apple.AppleMultitouchMouse and BT driver) 
        "com.apple.AppleMultitouchMouse" = {
          # 2-finger horizontal swipe → switch full-screen apps / Spaces
          "MouseTwoFingerHorizSwipeGesture" = 2;
          # 2-finger double-tap → Mission Control
          "MouseTwoFingerDoubleTapGesture" = 3;
          # (Smart zoom: 1-finger double-tap is on by default in Mouse settings UI.)
        };

        "com.apple.driver.AppleBluetoothMultitouch.mouse" = {
          "MouseTwoFingerHorizSwipeGesture" = 2;
          "MouseTwoFingerDoubleTapGesture" = 3;
        };

        # Temporary
       "com.apple.dock" = {
          showAppExposeGestureEnabled = true;
          showMissionControlGestureEnabled = true;
          showDesktopGestureEnabled = true;
          showLaunchpadGestureEnabled = true;
        };
        "com.apple.AppleMultitouchTrackpad" = {
          ForceSuppressed = false;                # keep force click enabled
          TrackpadPinch = true;                   # pinch to zoom
          TrackpadRotate = true;                  # two-finger rotate
          TrackpadTwoFingerDoubleTapGesture = true;  # smart zoom
          TrackpadThreeFingerHorizSwipeGesture = 2;  # 2 = full-screen apps
        };

        "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
          ForceSuppressed = false;
          TrackpadPinch = true;
          TrackpadRotate = true;
          TrackpadTwoFingerDoubleTapGesture = true;
          TrackpadThreeFingerHorizSwipeGesture = 2;
        };
      };

      loginwindow = {
        GuestEnabled = false;  # disable guest user
        SHOWFULLNAME = true;  # show full name in login window
      };
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  # Fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable-small/pkgs/data/fonts/nerd-fonts/manifests/fonts.json
      nerd-fonts.jetbrains-mono
    ];
  };
}
