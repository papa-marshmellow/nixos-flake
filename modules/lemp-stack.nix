{ pkgs, config, lib, ... }: {

  services.httpd = {
    enable = true;
    enablePHP = true;
    virtualHosts."localhost" = {
      documentRoot = "/var/www/html";
    };
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

}
