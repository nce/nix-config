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
      kubectl-tree
      kubectl-ktop
      kubecolor
      kustomize
      kubernetes-helm
      dive
      stern
      krew
      teleport
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

      initContent = ''
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

    k9s = {
      enable = true;

      plugins = {

        stern = {
          shortCut = "Shift-L";
          confirm = false;
          description = "Logs <Stern>";
          scopes = [ "pods" ];
          command = "stern";
          background = false;
          args = [
            "--tail"
            "50"
            "$FILTER"
            "-n"
            "$NAMESPACE"
            "--context"
            "$CONTEXT"
          ];
        };

        reconcile-hr = {
          shortCut = "Shift-R";
          confirm = false;
          description = "Flux reconcile";
          scopes = [
            "helmreleases"
          ];
          command = "bash";
          background = false;
          args = [
            "-c"
            "flux --context $CONTEXT reconcile helmrelease -n $NAMESPACE $NAME |& less"
          ];
        };
      };

      settings = {
        k9s = {
          refreshRate = 2;
          maxConnRetry = 5;
          noExitOnCtrlC = false;
          readOnly = false;
          ui = {
            enableMouse = false;
            headless = false;
            logoless = true;
            crumbsless = false;
            noIcons = false;
          };
          #  skipLatestRevCheck= false;
          logger = {
            tail = 100;
            buffer = 5000;
            sinceSeconds = -1;
            fullScreenLogs = false;
            textWrap = true;
            showTime = false;
          };
          thresholds = {
            cpu = {
              critical = 90;
              warn = 70;
            };
            memory = {
              critical = 90;
              warn = 70;
            };
          };

        };
      };
    };

  };
}
