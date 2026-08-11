{pkgs}: let
  inherit (pkgs) lib stdenv;

  version = "0.9.1";
  platformSuffix =
    {
      x86_64-linux = "x64";
      aarch64-linux = "arm64";
      armv7l-linux = "armv7l";
    }
    .${
      stdenv.hostPlatform.system
    }
    or (throw "Unsupported system for aks-desktop: ${stdenv.hostPlatform.system}");
in
  stdenv.mkDerivation {
    pname = "aks-desktop";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/Azure/aks-desktop/releases/download/v${version}/aks-desktop-${version}-linux-${platformSuffix}.tar.gz";
      hash = "sha256-7BjAGe7b3jObt++yNPADvkT0211uc85zmIEa5FJLr9s=";
    };

    sourceRoot = "aks-desktop-${version}-linux-${platformSuffix}";

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      makeWrapper
    ];

    buildInputs = with pkgs; [
      alsa-lib
      at-spi2-atk
      atk
      cairo
      cups
      dbus
      expat
      glib
      gtk3
      libdrm
      libgbm
      libGL
      libxcrypt-legacy
      libxkbcommon
      nspr
      nss
      pango
      stdenv.cc.cc.lib
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      libxrender
      libxtst
      libxcb
    ];

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/opt/aks-desktop" "$out/bin" "$out/share/applications"
      cp -r . "$out/opt/aks-desktop"

      chmod +x "$out/opt/aks-desktop/aks-desktop" "$out/opt/aks-desktop/chrome-sandbox"

      makeWrapper "$out/opt/aks-desktop/aks-desktop" "$out/bin/aks-desktop" \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [
        pkgs.alsa-lib
        pkgs.at-spi2-atk
        pkgs.atk
        pkgs.cairo
        pkgs.cups
        pkgs.dbus
        pkgs.expat
        pkgs.glib
        pkgs.gtk3
        pkgs.libdrm
        pkgs.libgbm
        pkgs.libGL
        pkgs.libxcrypt-legacy
        pkgs.libxkbcommon
        pkgs.nspr
        pkgs.nss
        pkgs.pango
        pkgs.stdenv.cc.cc.lib
        pkgs.libx11
        pkgs.libxcomposite
        pkgs.libxdamage
        pkgs.libxext
        pkgs.libxfixes
        pkgs.libxrandr
        pkgs.libxrender
        pkgs.libxtst
        pkgs.libxcb
      ]}"

      install -Dm644 resources/frontend/android-chrome-512x512.png \
        "$out/share/icons/hicolor/512x512/apps/aks-desktop.png"

      cat > "$out/share/applications/aks-desktop.desktop" <<EOF
      [Desktop Entry]
      Type=Application
      Name=AKS Desktop
      Comment=Application-focused experience for Azure Kubernetes Service
      Exec=$out/bin/aks-desktop
      Icon=aks-desktop
      Terminal=false
      Categories=Development;
      EOF

      runHook postInstall
    '';

    meta = with lib; {
      description = "AKS Desktop app for Azure Kubernetes Service";
      homepage = "https://github.com/Azure/aks-desktop";
      license = licenses.asl20;
      sourceProvenance = [sourceTypes.binaryNativeCode];
      platforms = ["x86_64-linux" "aarch64-linux" "armv7l-linux"];
      mainProgram = "aks-desktop";
      maintainers = [];
    };
  }
