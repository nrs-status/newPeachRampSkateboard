{ pkgsLib }:
{ dir, pred, recursive ? true }:
(import ./withDebug.nix) rec {
  fileListing = if recursive then
    pkgsLib.filesystem.listFilesRecursive dir
  else
    builtins.attrNames (builtins.readDir dir);
  __output = builtins.filter pred fileListing;
}
