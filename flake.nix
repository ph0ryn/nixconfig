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
    nix-secure-enclave-key = {
      url = "github:ryoppippi/nix-secure-enclave-key";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    moonbit-overlay = {
      url = "github:moonbit-community/moonbit-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
    indexion-nix = {
      url = "github:ph0ryn/indexion-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    beankey = {
      url = "git+https://github.com/ph0ryn/beankey.git?ref=main&submodules=1";
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
      nix-secure-enclave-key,
      gh-fzf-get,
      gh-license,
      filetree-nix,
      indexion-nix,
      moonbit-overlay,
      beankey,
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
              extraSpecialArgs = {
                inherit user;
                nixSecureEnclaveKey = nix-secure-enclave-key;
              };
              users.${user} = import ./hosts/nix-darwin/home.nix;
            };
          }
          {
            nixpkgs.overlays = [
              gh-fzf-get.overlays.default
              gh-license.overlays.default
              filetree-nix.overlays.default
              indexion-nix.overlays.default
              moonbit-overlay.overlays.default
            ];
          }
        ];
      };

      nixosConfigurations.NixPavilion = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit user;
        };
        modules = [
          ./hosts/nixos-pav/configuration.nix
          home-manager.nixosModules.home-manager
          beankey.nixosModules.default
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
              indexion-nix.overlays.default
              moonbit-overlay.overlays.default
            ];
          }
        ];
      };
    };
}
