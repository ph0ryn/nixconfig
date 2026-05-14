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
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    gh-fzf-get = {
      url = "github:ph0ryn/gh-fzf-get";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gh-license = {
      url = "github:ph0ryn/gh-license";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nix-homebrew,
      gh-fzf-get,
      gh-license,
      ...
    }:
    let
      user = "ph0ryn";
    in
    {
      darwinConfigurations."AirPh0ryn" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit self user nix-homebrew; };
        modules = [
          ./nix-darwin/configuration.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          {
            nixpkgs.overlays = [
              gh-fzf-get.overlays.default
              gh-license.overlays.default
            ];
          }
        ];
      };
    };
}
