{ config, pkgs, ... }:
let
  mongodbDataDir = "${config.home.homeDirectory}/.local/state/mongodb/data";
  mongodbLogDir = "${config.home.homeDirectory}/.local/state/mongodb/log";
  mongodbStart = pkgs.writeShellScript "mongodb-start" ''
    set -euo pipefail

    mkdir -p "${mongodbDataDir}" "${mongodbLogDir}"
    exec ${pkgs.mongodb-ce}/bin/mongod \
      --bind_ip 127.0.0.1 \
      --dbpath "${mongodbDataDir}" \
      --logappend \
      --logpath "${mongodbLogDir}/mongod.log"
  '';
in
{
  home.packages = with pkgs; [
    mongodb-ce
    mongodb-compass
    mongosh
  ];

  launchd.agents.mongodb = {
    enable = true;
    config = {
      ProgramArguments = [
        "${mongodbStart}"
      ];
      RunAtLoad = true;
      KeepAlive = false;
    };
  };
}
