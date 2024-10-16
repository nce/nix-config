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

                command -v fzf >/dev/null 2>&1 && { 
          source <(kubectl completion zsh | sed 's#''${requestComp} 2>/dev/null#''${requestComp} 2>/dev/null | head -n-1 | fzf  --multi=0 #g')
        }
                alias kubectl="kubecolor"
                compdef kubecolor=kubectl
      '';
      shellAliases = {
        kgpnr = "k get pod -A|grep -v \"Runni\|Compl\"";
      };
    };
  };
}
