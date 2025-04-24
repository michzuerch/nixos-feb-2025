{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-radius = 8;
      fit-to-screen = true;
      layer-shell = true;
      control-center-layer = "overlay";
      cssPriority = "user";
      notification-icon-size = 64;
      notification-body-image-height = 120;
      notification-body-image-width = 250;
      timeout = 8;
      timeout-low = 4;
      timeout-critical = 0;

      widgets = [
        "inhibitors"
        "dnd"
        "notifications"
      ];

      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };
        dnd = {
          text = "Do not disturb";
        };
      };
    };
  };
  # packages = with pkgs; [swaynotificationcenter];
}
