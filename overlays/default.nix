{inputs, ...}: {
  vscode-packages = final: _prev: {
    pkgs-ext = import inputs.nixpkgs {
      system = final.system;
      config.allowUnfree = true;
      overlays = [inputs.nix-vscode-extensions.overlays.default];
    };
  };
}
