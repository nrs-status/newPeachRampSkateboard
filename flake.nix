
{
  description = "libs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs:
    let pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
      preLib = import ./billProjectsBelt { pkgsLib = pkgs.lib; };
    in {
      baseLib = preLib;
    };
}
