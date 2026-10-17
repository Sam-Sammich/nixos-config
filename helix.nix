{ symlinkJoin, helix, makeWrapper }:

symlinkJoin {
  name = "helix";
  paths = [ helix ];
  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/hx --add-flags "-c ${./helix-config.toml}"
  '';
}
