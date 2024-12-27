{self, ...}: {
  programs.nixvim.plugins.lsp.servers.nixd = {
    enable = true;
    settings = let
      nixos = "(builtins.getFlake \"${self}\").nixosConfigurations.reno.options";
      home-manager = nixos + ".home-manager.users.type.getSubOptions []";
    in {
      formatting = {
        command = ["alejandra"];
      };
      options = {
        nixos.expr = nixos;
        home-manager.expr = home-manager;
        nixvim.expr = "(${home-manager}).programs.nixvim.type.getSubOptions [\"programs\" \"nixvim\"]";
      };
    };
  };
}
