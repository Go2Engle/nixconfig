
  description = "framework flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20511";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      "framework" = nixpkgs.lib.niosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cengle = import ./home.nix;
          }
        ];
      };
    };
  };
}
