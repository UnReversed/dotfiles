{pkgs, ...}: {
  home.packages = with pkgs; [
    terraform
    opentofu
    terragrunt
  ];
}
