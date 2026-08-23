{ pkgsLib }:
{ dir, pred }:
(import ./withDebug.nix) rec {
  fileListing = pkgsLib.filesystem.listFilesRecursive dir;
  __output = builtins.filter pred fileListing;
}
