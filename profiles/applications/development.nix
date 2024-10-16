{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      go
      golangci-lint
      go-critic
      cargo
      nixfmt-rfc-style
    ];
  };

  programs = {
    k9s = {
      enable = true;

      plugin = {
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
            sinceSeconds = 60;
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
