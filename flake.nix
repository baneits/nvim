{
  description = "Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-wrappers.url = "github:Birdeehub/nix-wrapper-modules";
  };

  outputs = { self, nixpkgs, ... }@inputs: let
    # Define the systems you want to support
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

    # A helper function to generate outputs for each system
    # It imports nixpkgs for the system and passes the resulting 'pkgs' to the function 'f'
    forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f (import nixpkgs {inherit system;}));
  in {
      packages = forAllSystems (
      pkgs: let
        pkgList = with pkgs; [
        # LSPs
        
        # tools

        ];
      in {
        # Define the default package for this system
        default = inputs.nix-wrappers.wrappers.neovim.wrap {
        inherit pkgs;
      
        # I want to have my nvim config to be written in LUA so I tell nix-wrappers to take this repo as the config 
        settings.config_directory = ./.;
        };
      }
    );
  };
}
