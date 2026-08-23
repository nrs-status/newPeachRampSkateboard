{ pkgsLib }:
{ dir, pred, recursive ? false }:
(import ./withDebug.nix) rec {
  fileListing = if recursive then
    pkgsLib.filesystem.listFilesRecursive dir
  else
    builtins.readDir dir;
  __output = builtins.filter pred fileListing;
}
