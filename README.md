# hint

> [!WARNING]  
> this is a wip project -- and i've no idea how to use nix


# restore system
## prerequisites
1. Restore .ssh/{config,git,ed255} keys from backup

2. Restore .gnupg from backup

3. Restore .oci from backup

4. Run:
```sh
xcode-select --install
```

## nix installer
The `determinate.systems` installer is

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## install `mbair22`
```
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake "github.com:nce/nix-config#mbair22"
```

Rebuild system:
```sh
darwin-rebuild switch --flake ~/nix#nce
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
