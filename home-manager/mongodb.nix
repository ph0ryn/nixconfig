{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mongodb-ce
    mongosh
  ];
}
