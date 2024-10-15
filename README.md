# hint

> [!WARNING]  
> this is a wip project -- and i've no idea how to use nix

# install

The `determinate.systems` installer is

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/nix#nce
```

Rebuild system:

```sh
darwin-rebuild switch --flake ~/nix#nce
```
