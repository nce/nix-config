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
      enableDefaultConfig = false;

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
        "*" = {
          addKeysToAgent = "yes";
          forwardAgent = true;
          serverAliveInterval = 30;
          serverAliveCountMax = 3;
          hashKnownHosts = false;
          userKnownHostsFile = "~/.ssh/known_hosts";
          controlMaster = "auto";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "10m";
        };

        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/git_ed25519";
        };
      };

    };

  };
}
