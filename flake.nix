{
  description = "Dev shell for khangtpham25.github.io (Jekyll + Chirpy)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { nixpkgs, ... }:
    let
      # Only x86_64-linux (NixOS) has been tested
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            ruby_3_3
            bundler
            git
            prek
            nodejs # for the prettier hook
            # to compile native gems (nokogiri, ffi, ...)
            gcc
            gnumake
            pkg-config
            libxml2
            libxslt
            zlib
            libffi
            curl # libcurl, loaded via FFI by html-proofer
          ];

          shellHook = ''
            export BUNDLE_PATH="$PWD/vendor/bundle"
            export BUNDLE_FORCE_RUBY_PLATFORM=true
            export BUNDLE_BUILD__NOKOGIRI="--use-system-libraries"
            export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [ pkgs.curl ]}''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
          '';
        };
      });
    };
}
