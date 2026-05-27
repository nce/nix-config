{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      codex
      opencode
      ollama
      ctx7
      llmfit
    ];
  };
}
