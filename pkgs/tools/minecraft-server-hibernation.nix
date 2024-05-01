pkgs@{ lib, fetchFromGitHub, buildGoModule }:
pkgs.buildGoModule {
  pname = "minecraft-server-hibernation";
  version = "2.5.0";
  src = fetchFromGitHub {
    owner = "gekware";
    repo = "minecraft-server-hibernation";
    rev = "v2.5.0";
    sha256 = "sha256-b6LeqjIraIasHBpaVgy8esl4NV8rdBrfO7ewgeIocS8=";
  };

  postFixup = ''
    ln -s msh $out/bin/minecraft-server-hibernation
  '';

  # Dependencies are already vendored (!!).
  vendorHash = null;
  # The networking test fails for me.
  doCheck = false;
}
