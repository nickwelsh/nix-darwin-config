{ config, lib, ... }:

let
  karabinerConfig = {
    profiles = [
      {
        name = "Default profile";
        selected = true;

        complex_modifications = {
          rules = [
            {
              description = "double right shift to cap_lock";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "right_shift";
                    modifiers = { optional = [ "any" ]; };
                  };
                  to = [
                    { key_code = "caps_lock"; }
                  ];
                  conditions = [
                    {
                      type = "variable_if";
                      name = "right_shift pressed";
                      value = 1;
                    }
                  ];
                }
                {
                  type = "basic";
                  from = {
                    key_code = "right_shift";
                    modifiers = { optional = [ "any" ]; };
                  };
                  to = [
                    {
                      set_variable = {
                        name = "right_shift pressed";
                        value = 1;
                      };
                    }
                    { key_code = "right_shift"; }
                  ];
                  to_delayed_action = {
                    to_if_canceled = [
                      {
                        set_variable = {
                          name = "right_shift pressed";
                          value = 0;
                        };
                      }
                    ];
                    to_if_invoked = [
                      {
                        set_variable = {
                          name = "right_shift pressed";
                          value = 0;
                        };
                      }
                    ];
                  };
                }
              ];
            }
            {
              description = "Change caps_lock key to command+control+option+shift. (Post f19 key when pressed alone)";
              manipulators = [
                {
                  type = "basic";
                  from = {
                    key_code = "caps_lock";
                    modifiers = { optional = [ "any" ]; };
                  };
                  to = [
                    {
                      key_code = "left_shift";
                      modifiers = [
                        "left_command"
                        "left_control"
                        "left_option"
                      ];
                    }
                  ];
                  to_if_alone = [
                    { key_code = "f19"; }
                  ];
                }
              ];
            }
          ];
        };

        virtual_hid_keyboard = {
          country_code = 0;
          keyboard_type_v2 = "ansi";
        };
      }
    ];
  };
in {
  # ~/.config/karabiner/karabiner.json
  xdg.configFile."karabiner/karabiner.json".text =
    builtins.toJSON karabinerConfig;
}
