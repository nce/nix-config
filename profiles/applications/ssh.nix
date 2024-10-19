{
  pkgs,
  lib,
  ...
}:
with lib;

{
  programs = {

    ssh = {
      enable = true;
      addKeysToAgent = "yes";
      forwardAgent = true;

      extraConfig = ''
        IgnoreUnknown UseKeychain
        UseKeychain yes
      '';

      # no idea how to integrate this...
      # Host i-* mi-*
      #   User core
      #   StrictHostKeyChecking no
      #   UserKnownHostsFile /dev/null
      #   ProxyCommand sh -c "aws ssm --profile adorsys-sandbox start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'"

      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/git_ed25519";
        };
      };

    };

  };
}
