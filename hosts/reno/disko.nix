{
  disko.devices = {
    disk = {
      nvme1n1 = {
        type = "disk";
        device = "/dev/nvme1n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            crypted1 = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted1";
                passwordFile = "/tmp/secret.key";
                settings.allowDiscards = true;
              };
            };
          };
        };
      };
      nvme0n1 = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            swap = {
              size = "8G";
              content = {
                type = "swap";
              };
            };
            crypted2 = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted2";
                passwordFile = "/tmp/secret.key";
                settings.allowDiscards = true;
                content = {
                  type = "btrfs";
                  extraArgs = [
                    "-m raid1"
                    "-d single"
                    "/dev/mapper/crypted1"
                  ];
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
