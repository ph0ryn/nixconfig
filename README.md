# nixconfig

Personal Nix configuration for macOS and NixOS.

## Hosts

- `AirPh0ryn`: Apple Silicon macOS managed with nix-darwin
- `NixPavilion`: x86_64 NixOS

## Installation

### macOS

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

### NixOS

```sh
# 1. clone this repository
nix shell nixpkgs#git -c git clone https://github.com/ph0ryn/nixconfig.git ~/nixconfig

# 2. apply the configuration
sudo nixos-rebuild switch --flake ~/nixconfig#NixPavilion
```

## Commands

update

```sh
# all
nix flake update

# selected inputs
nix flake update nixpkgs
nix flake update nixpkgs-nixos
nix flake update home-manager
nix flake update home-manager-nixos
nix flake update nix-darwin
```

switch macOS

```sh
sudo darwin-rebuild switch --flake ~/nixconfig#AirPh0ryn
```

switch NixOS

```sh
sudo nixos-rebuild switch --flake ~/nixconfig#NixPavilion
```
