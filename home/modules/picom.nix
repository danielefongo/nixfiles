{ config, options, lib, pkgs, dots, ... }:

{
  home.packages = [ pkgs.picom ];

  xdg.configFile."picom/picom.conf" = {
    source = "${dots}/picom/picom.conf";
    onChange = "${pkgs.systemd}/bin/systemctl --user restart picom.service";
  };

  systemd.user.services.picom = {
    Unit = {
      Description = "Picom";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };

    Service = {
      ExecStart = "${pkgs.picom}/bin/picom";
      Restart = "always";
      RestartSec = 2;
    };
  };
}
