{
  description = "Darwin config by @nce";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homemanager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs =
    {
      self,
      darwin,
      nixpkgs,
      homemanager,
      mac-app-util,
      ...
    }@inputs:
    let
      configuration =
        { config, pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            #pkgs.neovim
          ];
          services.nix-daemon.enable = true;
          nix.settings.experimental-features = "nix-command flakes";

          security.pam.enableSudoTouchIdAuth = true;

          nixpkgs.hostPlatform = "aarch64-darwin";

          # Create /etc/zshrc that loads the nix-darwin environment.
          # don't remove... (or restore /run/current-system/sw/bin/darwin-rebuild  switch  --flake .#mbair22)
          programs.zsh.enable = true;
        };

      username = "nce";

      mkComputer =
        configurationNix: systemName: extraModules:
        darwin.lib.darwinSystem {
          system = systemName;

          modules = [
            configuration
            mac-app-util.darwinModules.default
            homemanager.darwinModules.home-manager
            configurationNix
          ] ++ extraModules;

          specialArgs = {
            inherit inputs;
            inherit username;
          };

        };
    in
    {
      darwinConfigurations = {
        mbair22 = mkComputer ./machines/mbair22 "aarch64-darwin" [
          ./profiles/user.nix
          {
            home-manager = {
              extraSpecialArgs = {
                inherit inputs;
              };
              sharedModules = [
                mac-app-util.homeManagerModules.default
              ];
              users = {
                ${username} = {
                  imports = [
                    ./profiles/home.nix
                  ];
                };
              };
            };
          }
        ];
      };
      mbair22 = self.darwinConfigurations.mbair22.system;
    };
}
