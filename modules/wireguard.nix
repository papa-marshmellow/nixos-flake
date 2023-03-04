{ pkgs, ... }:
{
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.13.13.3/24" ];
      dns = [ "10.13.13.1" ];
      privateKeyFile = "/etc/wireguard/mom-house/private.key";
      peers = [
        {
          publicKey = "29Sy3/sbHuBiI8xDSzRmwN0RTMjb9DsfeHwO4NNb5lY=";
          presharedKeyFile = "/etc/wireguard/mom-house/preshared.key";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "joneserconvention.com:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
