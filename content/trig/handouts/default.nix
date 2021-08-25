let 
  nixpkgs = import <nixpkgs> {};
  pkgsSrc = nixpkgs.pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs-channels";
    rev = "adfcc2d9531e78bf6a9e3b56e2f4fc873cb3d87b";
    sha256 = "101mh6gb9wlx0lq5pw2m0n1fi3h2pag3ndg184rrqzvn9ynp28iw";
  };
  pkgs = import pkgsSrc {};

  eqexam.pkgs = [
    (pkgs.stdenv.mkDerivation rec {
      version = "2012-05-17";
      pname = "eqexam";
      name = "${pname}-${version}";
      tlType = "run";

      src = pkgs.fetchurl {
        url = "http://www.math.uakron.edu/~dpstory/eqexam/eqexam_pack.zip";
        sha256 = "0g4w9ma6cr277li5b8dps9fm9jkjlwzwjc6ix01mw4kva4h5fdrj";
      };

      buildInputs = [ pkgs.unzip pkgs.texlive.combined.scheme-basic ];

      buildPhase = "
        latex eqexam.ins
      ";

      installPhase = "
        mkdir -p $out/tex/latex/eqexam
        cp -va *.sty *.cfg *.def $out/tex/latex/eqexam
        mkdir -p $out/doc/latex/eqexam
        cp -va doc/* $out/doc/latex/eqexam
      ";

      meta = {
        branch = "3";
        platforms = pkgs.stdenv.lib.platforms.unix;
      };
    })
  ];

  mytexlive =  (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic;
    inherit eqexam;
  });

in pkgs.stdenv.mkDerivation {
  name = "texlive-combined-custom";
  buildInputs = [ 
    mytexlive
    pkgs.zathura
  ]; 
}
