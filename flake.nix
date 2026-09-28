{
  description = "Home Manager configuration of ph0ryn";

  nixConfig = {
    extra-substituters = [
      "https://beankey.cachix.org"
      "https://vicinae.cachix.org"
    ];
    extra-trusted-public-keys = [
      "beankey.cachix.org-1:iE4tWJfPogk+oWopayLECdSsw+H1vqsVnMvmRPHSQ6k="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };

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
    vicinae.url = "github:vicinaehq/vicinae";

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
      url = "github:ph0ryn/beanKey";
    };
    ankerscale = {
      url = "github:ph0ryn/AnkerScale";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.moonbit-overlay.follows = "moonbit-overlay";
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
      ankerscale,
      vicinae,
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
              sharedModules = [
                beankey.homeModules.default
                vicinae.homeManagerModules.default
              ];
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
              ankerscale.overlays.default
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
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-backup";
              extraSpecialArgs = { inherit user; };
              sharedModules = [ beankey.homeModules.default ];
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
