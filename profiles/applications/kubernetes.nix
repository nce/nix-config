{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      fluxcd
      kubectl
      kubecolor
      kustomize
      kubernetes-helm
      dive
      stern
      krew
    ];
  };

  programs = {
    zsh = {

      zplug.plugins = [
        {
          name = "plugins/kubectl";
          tags = [
            "from:oh-my-zsh"
          ];
        }
      ];

      initExtra = ''
        source <(flux completion zsh)

        source <(kubectl completion zsh)
        alias kubectl="kubecolor"
        compdef kubecolor=kubectl
      '';
      shellAliases = {
        kgpnr = "k get pod -A|grep -v \"Runni\|Compl\"";
      };
    };
  };
}
