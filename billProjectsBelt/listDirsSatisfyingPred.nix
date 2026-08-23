{ pkgsLib }:
{ dir, pred }:
(import ./withDebug.nix) rec {
  recursiveListing = pkgsLib.filesystem.listFilesRecursive dir;
  keepElmsSatisfyingPred = builtins.filter pred recursiveListing;
  __output = keepElmsSatisfyingPred;
}
