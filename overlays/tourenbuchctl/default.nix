{
  lib,
  stdenv,
  pkgs,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {

  name = "tourenbuchctl";

  version = "0.3.0";

  # https://nixos.wiki/wiki/Packaging/Binaries
  src = pkgs.fetchurl {
    name = "tourenbuchctl";
    url = "https://github.com/nce/tourenbuchctl/releases/download/v${version}/tourenbuchctl_${version}_darwin_arm64";
    hash = "sha256-j08Kk0YzoBiLY+MTRTCgi/pveE/5KzlEjRTh2SDTXTM=";
  };

  phases = [ "installPhase" ];
  installPhase = ''
    install -m755 -D ${src} $out/bin/tourenbuchctl
  '';

  meta = with lib; {
    homepage = "https://github.com/nce/tourenbuchctl";
    description = "tourenbuchctl";
    platforms = platforms.darwin;
  };
}
