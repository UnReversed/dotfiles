{nixvim, ...}: {
  imports = [
    nixvim.homeModules.nixvim
    ./nixvim
  ];
}
