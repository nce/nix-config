# Client Setup
this setup provisions my client/local systems.

> [!WARNING]  
> although this works, i've no idea how to nix


# System Restore/First Steps
## Prerequisites
1. Restore `.ssh/*` keys from backup
2. Restore .oci from backup
3. Run:
```sh
xcode-select --install
```

## Nix installer
Nix System is installed with the  `determinate.systems` installer, after the first system boot:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Initial Provision `mbair22`
```
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake "github.com/nix-config#mbair22"
```

Rebuild system:
```sh
darwin-rebuild switch --flake .#mbair22
```

## Initial Provision `macminipro24`
```
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake "github.com/nix-config#macminipro24"
```
Rebuild system:
```sh
darwin-rebuild switch --flake .#macminipro24
```

## After install steps
### Keyboard Layout
Install EurKey by hand...
### Browser
Set Default Browser via System Settings

## Updates
```sh
nix flake update
darwin-rebuild switch --flake ...

```
