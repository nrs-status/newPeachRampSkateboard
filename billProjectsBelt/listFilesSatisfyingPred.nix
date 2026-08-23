{ pkgsLib }:
{ dir, pred }:
(import ./withDebug.nix) rec {
  fileListing = pkgsLib.filesystem.listFilesRecursive dir;
  directories = pkgsLib.lists.unique (map dirOf fileListing);
  __output = builtins.filter pred (directories ++ fileListing);
}
