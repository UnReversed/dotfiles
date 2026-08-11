{
  pkgs,
  version,
  src,
  headlampFrontendNpmDeps,
}:
pkgs.buildNpmPackage {
  pname = "aks-desktop-headlamp-frontend";
  inherit version;

  src = "${src}/headlamp/frontend";
  nodejs = pkgs.nodejs_22;
  npmDeps = headlampFrontendNpmDeps;
  npmBuildScript = "build";

  postPatch = ''
    # Avoid invoking git in the prebuild step.
    substituteInPlace package.json --replace-fail '"prebuild": "npm run make-version",' ""
  '';

  preBuild = ''
    cat > .env <<EOF
    REACT_APP_HEADLAMP_VERSION=0.43.0
    REACT_APP_HEADLAMP_GIT_VERSION=v0.43.0
    REACT_APP_HEADLAMP_PRODUCT_NAME=AKS desktop
    REACT_APP_AKS_DESKTOP_VERSION=${version}
    REACT_APP_ENABLE_REACT_QUERY_DEVTOOLS=false
    REACT_APP_HEADLAMP_SIDEBAR_DEFAULT_OPEN=true
    EOF
  '';

  env = {
    PUBLIC_URL = "./";
    NODE_OPTIONS = "--max-old-space-size=8096";
  };

  installPhase = ''
    runHook preInstall
    cp -r build "$out"
    runHook postInstall
  '';

  meta = {
    platforms = ["x86_64-linux" "aarch64-linux"];
  };
}
