{...}: {
  security.rtkit.enable = true;
  services.haveged.enable = true; # faster ssdm load said by random ppl from internet
}
