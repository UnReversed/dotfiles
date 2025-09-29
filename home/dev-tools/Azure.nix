{pkgs, ...}: {
  home.packages = with pkgs; [
    (azure-cli.withExtensions
      [
        azure-cli-extensions.account
        azure-cli-extensions.azure-devops
        azure-cli-extensions.image-copy-extension
      ])
    azuredatastudio
  ];
}
