{
  description = "Home Manager configuration of ph0ryn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-nixos.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-nixos = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs-nixos";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    gh-fzf-get = {
      url = "github:ph0ryn/gh-fzf-get";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gh-license = {
      url = "github:ph0ryn/gh-license";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    filetree-nix = {
      url = "github:ph0ryn/filetree-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-nixos,
      home-manager,
      home-manager-nixos,
      nix-darwin,
      nix-homebrew,
      gh-fzf-get,
      gh-license,
      filetree-nix,
      # nixvim,
      ...
    }:
    let
      user = "ph0ryn";
    in
    {
      darwinConfigurations.AirPh0ryn = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit
            self
            user
            nix-homebrew
            # nixvim
            ;
        };
        modules = [
          ./hosts/nix-darwin/configuration.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-backup";
              extraSpecialArgs = { inherit user; };
              users.${user} = import ./hosts/nix-darwin/home.nix;
            };
          }
          {
            nixpkgs.overlays = [
              gh-fzf-get.overlays.default
              gh-license.overlays.default
              filetree-nix.overlays.default
            ];
          }
        ];
      };

      nixosConfigurations.win = nixpkgs-nixos.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit user;
        };
        modules = [
          ./hosts/nixos-pav/configuration.nix
          home-manager-nixos.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-backup";
              extraSpecialArgs = { inherit user; };
              users.${user} = import ./hosts/nixos-pav/home.nix;
            };
          }
          {
            nixpkgs.overlays = [
              gh-fzf-get.overlays.default
              gh-license.overlays.default
              filetree-nix.overlays.default
            ];
          }
        ];
      };
    };
}
