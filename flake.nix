{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    systems.url = "github:nix-systems/default";
    devenv.url = "github:cachix/devenv";
  };

  outputs = { self, nixpkgs, devenv, systems, ... } @ inputs:
    let
      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      devenv-up = self.devShells.x86_64-linux.default.config.procfileScript;

      devShells = forEachSystem
        (system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
          in
          {
            default = devenv.lib.mkShell {
              inherit inputs pkgs;
              modules = [
                {
                  # https://devenv.sh/reference/options/
                  packages = pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.inotify-tools ];
                  
                  languages = {
                    nix.enable = true;

                    elixir = {
                      enable = true;
                      package = pkgs.beam.packages.erlangR25.elixir_1_15;
                    };
                  };

                  enterShell = ''
                    echo "
                    
                    Colab development environment. Running:
                    "
                    elixir --version
                    
                    echo "
                    Run
                    
                    $ devenv up 
                    to start postgres & phoenix.
                    The configuration for everything lies in flake.nix.
                    
                    "
                  '';

                  processes.phoenix.exec = "mix ecto.create && mix phx.server";

                  services.postgres.enable = true;
                }
              ];
            };
          });
    };
}
