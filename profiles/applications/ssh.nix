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

      settings = {
        "*" = {
          AddKeysToAgent = "yes";
          ForwardAgent = true;
          ServerAliveInterval = 30;
          ServerAliveCountMax = 3;
          HashKnownHosts = false;
          UserKnownHostsFile = "~/.ssh/known_hosts";
          ControlMaster = "auto";
          ControlPath = "~/.ssh/master-%r@%n:%p";
          ControlPersist = "10m";
        };

        "github.com" = {
          HostName = "github.com";
          User = "git";
          IdentityFile = "~/.ssh/git_ed25519";
        };
      };

    };

  };
}
