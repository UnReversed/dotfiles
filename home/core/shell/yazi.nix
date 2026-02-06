{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    plugins = {
      starship = pkgs.fetchFromGitHub {
        owner = "Rolv-Apneseth";
        repo = "starship.yazi";
        rev = "eca186171c5f2011ce62712f95f699308251c749";
        sha256 = "sha256-xcz2+zepICZ3ji0Hm0SSUBSaEpabWUrIdG7JmxUl/ts=";
      };
      compress = pkgs.fetchFromGitHub {
        owner = "KKV9";
        repo = "compress.yazi";
        rev = "cb6e8ec0141915dc319ccd6b904dcd2f03502576";
        sha256 = "sha256-D/EpcRDIc3toeyjHqi+vGw0v9B22HVvKJua5EVEAc0U=";
      };
    };
    initLua = ''
      require("starship"):setup()
    '';
  };
}
