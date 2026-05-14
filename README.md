# nixconfig

Personal nix-managed Apple Silicon macOS configuration

## Installation

```sh
# 1. install nix
curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install

# 2. clone config
git clone https://github.com/ph0ryn/nixconfig.git ~/nixconfig

# 3. bootstrap nix-darwin
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/nixconfig#AirPh0ryn

# 4. optional chezmoi
git clone https://github.com/ph0ryn/chezmoi-dotfiles.git ~/chezmoi
chezmoi apply
```

## Commands

update

```shell
# all
nix flake update

# selected inputs
nix flake update nixpkgs
nix flake update home-manager
nix flake update nix-darwin
```

switch

```shell
sudo darwin-rebuild switch --flake ~/nixconfig#AirPh0ryn
```
