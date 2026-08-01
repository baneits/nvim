{
  description = "Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-wrappers.url = "github:Birdeehub/nix-wrapper-modules";
  };

  outputs = {nixpkgs, ...} @ inputs: let
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
          lua-language-server
          python313Packages.python-lsp-server
          nixd
          rust-analyzer

          # Formatting tools
          stylua
          black
          alejandra
          rustfmt

          # Tools for nvim.treesitter
          gcc
          tree-sitter

          # Tools for telescope
          ripgrep
          fd
          fzf
        ];
      in {
        # Define the default package for this system
        default = inputs.nix-wrappers.wrappers.neovim.wrap {
          inherit pkgs;

          runtimePkgs = pkgList;
          settings.config_directory = ./.;
        };
      }
    );
  };
}
