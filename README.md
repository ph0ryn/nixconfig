# ph0ryn's Nix-darwin config

## command

update

```shell
nix flake update nixpkgs
nix flake update home-manager
nix flake update nix-darwin
```

switch

```shell
sudo darwin-rebuild switch --flake .#AirPh0ryn
```

## env

```shell
export DARWIN_USER=$(whoami)
export DARWIN_HOST=$(hostname -s)
```
