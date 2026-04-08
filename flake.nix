{
  description = "Home Manager configuration of ph0ryn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-darwin,
      ...
    }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixpkgs.config.allowUnfree = true;
      homeConfigurations."ph0ryn" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./configuration.nix
          ./home-manager/home.nix
        ];
      };
      darwinConfigurations."AirPh0ryn" = nix-darwin.lib.darwinSystem {
        modules = [ ./nix-darwin/configuration.nix ];
      };
    };
}
