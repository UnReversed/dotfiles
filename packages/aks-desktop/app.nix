{
  pkgs,
  version,
  src,
  headlampAppNpmDeps,
}:
pkgs.buildNpmPackage {
  pname = "aks-desktop-headlamp-app";
  inherit version;

  src = "${src}/headlamp/app";
  nodejs = pkgs.nodejs_22;
  npmDeps = headlampAppNpmDeps;
  npmBuildScript = "compile-electron";

  env.ELECTRON_SKIP_BINARY_DOWNLOAD = "1";

  # Build-only package; runtime assembly happens in the final derivation.
  installPhase = ''
    runHook preInstall

    mkdir -p "$out"
    cp package.json "$out/"
    cp -r build "$out/"
    cp -r node_modules "$out/"

    runHook postInstall
  '';

  meta = {
    platforms = ["x86_64-linux" "aarch64-linux"];
  };
}
