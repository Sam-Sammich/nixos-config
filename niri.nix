{ pkgs, lib, ... }:
{
  settings = {
    prefer-no-csd = _: { };
    input.warp-mouse-to-focus = _: { };
    input.focus-follows-mouse = _: { };
    layout = {
      gaps = 16;
      focus-ring = {
        width = 4;
        active-color = "#7fc8ff";
      };
      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];
    };
    spawn-at-startup = [ [ "${pkgs.swaybg}/bin/swaybg" "-i" "~/walls/test.png" ] ];
    window-rule = {
      geometry-corner-radius = 12;
      clip-to-geometry = true;
    };
    binds = {
      "Mod+Shift+Slash".show-hotkey-overlay = _: { };
      "Mod+Return".spawn = [ "${pkgs.kitty}/bin/kitty" ];
      "Mod+D".spawn = [ "${pkgs.rofi}/bin/rofi" "-show" "drun" ];
      "Mod+Q" = _: {
        props.repeat = false;
        content.close-window = _: { };
      };
      "Mod+F".maximize-column = _: { };
      "Mod+Shift+F".fullscreen-window = _: { };
      "Mod+R".switch-preset-column-width = _: { };
      "Mod+Shift+R".switch-preset-column-width-back = _: { };
      "Mod+Ctrl+R".reset-window-height = _: { };
      "Mod+O" = _: {
        props.repeat = false;
        content.close-window = _: { };
      };

      "Mod+Minus".set-column-width = "-10%";
      "Mod+Equal".set-column-width = "+10%";
      "Mod+Shift+Minus".set-window-height = "-10%";
      "Mod+Shift+Equal".set-window-height = "+10%";

      "Mod+V".toggle-window-floating = _: { };
      "Mod+Shift+V".switch-focus-between-floating-and-tiling = _: { };
      "Mod+W".toggle-column-tabbed-display = _: { };

      "Mod+Escape" = _: {
        props.allow-inhibiting = false;
        content.toggle-keyboard-shortcuts-inhibit = _: { };
      };
      
      "Mod+Shift+E".quit = _: { };
      "Ctrl+Alt+Delete".quit = _: { };
      

      "Mod+H".focus-column-left = _: { };
      "Mod+J".focus-window-down = _: { };
      "Mod+K".focus-window-up = _: { };
      "Mod+L".focus-column-right = _: { };

      "Mod+Ctrl+H".move-column-left = _: { };
      "Mod+Ctrl+J".move-window-down = _: { };
      "Mod+Ctrl+K".move-window-up = _: { };
      "Mod+Ctrl+L".move-column-right = _: { };

      "Mod+Shift+Ctrl+H".move-column-to-monitor-left = _: { };
      "Mod+Shift+Ctrl+J".move-column-to-monitor-down = _: { };
      "Mod+Shift+Ctrl+K".move-column-to-monitor-up = _: { };
      "Mod+Shift+Ctrl+L".move-column-to-monitor-right = _: { };

      "Mod+U".focus-workspace-down = _: { };
      "Mod+I".focus-workspace-up = _: { };
      "Mod+Ctrl+U".move-column-to-workspace-down = _: { };
      "Mod+Ctrl+I".move-column-to-workspace-up = _: { };

      "Mod+Shift+U".move-workspace-up = _: { };
      "Mod+Shift+I".move-workspace-up = _: { };
      
      "Mod+1".focus-workspace = 1;
      "Mod+2".focus-workspace = 2;
      "Mod+3".focus-workspace = 3;
      "Mod+4".focus-workspace = 4;
      "Mod+5".focus-workspace = 5;
      "Mod+6".focus-workspace = 6;
      "Mod+7".focus-workspace = 7;
      "Mod+8".focus-workspace = 8;
      "Mod+9".focus-workspace = 9;

      "Mod+Ctrl+1".focus-workspace = 1;
      "Mod+Ctrl+2".focus-workspace = 2;
      "Mod+Ctrl+3".focus-workspace = 3;
      "Mod+Ctrl+4".focus-workspace = 4;
      "Mod+Ctrl+5".focus-workspace = 5;
      "Mod+Ctrl+6".focus-workspace = 6;
      "Mod+Ctrl+7".focus-workspace = 7;
      "Mod+Ctrl+8".focus-workspace = 8;
      "Mod+Ctrl+9".focus-workspace = 9;
      
      "Mod+BracketLeft".consume-or-expel-window-left = _: { };
      "Mod+BracketRight".consume-or-expel-window-right = _: { };
    };
  };
}
