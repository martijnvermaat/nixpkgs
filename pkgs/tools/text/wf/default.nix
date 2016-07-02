{ stdenv, fetchFromGitHub, rustPlatform }:

with rustPlatform;

buildRustPackage rec {
  name = "wf-${version}";
  version = "0.1.0";
  src = fetchFromGitHub {
    owner = "jarcane";
    repo = "wf";
    rev = "7ae2b3a";
    sha256 = "15mw82ylpx8mlzfsj92fcnq7dqlnhxkaqrf1wsdx5ccqgp2f7958";
  };

  depsSha256 = "0vaw0vrv0drk6398sg1y4ykrplayz21sxb9h8lldzxmmzk2s34ah";

  installPhase = ''
    mkdir -p $out/bin
    cp -p target/release/wf $out/bin/
  '';

  meta = with stdenv.lib; {
    description = "A Unix-style command line utility for counting word frequencies";
    homepage = https://github.com/jarcane/wf;
    license = stdenv.lib.licenses.agpl3;
    maintainers = maintainers.martijnvermaat;
  };
}
