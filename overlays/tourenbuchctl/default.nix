{ lib, stdenv, pkgs, fetchFromGitHub }:

stdenv.mkDerivation rec {

        name = "tourenbuchctl";

        version = "0.2.1";

        # https://nixos.wiki/wiki/Packaging/Binaries
   src = pkgs.fetchurl {
    name = "tourenbuchctl";
    url = "https://github.com/nce/tourenbuchctl/releases/download/v${version}/tourenbuchctl_${version}_darwin_arm64";
    hash = "sha256-4yCHqfhn2X6Fav85BMq8Izv0pBR+7yzmnP/LKBh7v1o=";
  };
        
phases = [ "installPhase" ];
        installPhase = ''
        install -m755 -D ${src} $out/bin/tourenbuchctl
        '';

        meta = with lib; {
          homepage = "https://postgrest.org";
          description = "REST API for any Postgres database";
          platforms = platforms.darwin;
        };
}

