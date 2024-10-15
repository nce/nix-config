{
  pkgs,
  ...
}@args:

{
  users = {
    users = {
      "${args.specialArgs.username}" = {
        description = "Ulli Goschler";
        shell = pkgs.zsh;
        home = "/Users/${args.specialArgs.username}";
      };
    };
  };
}
