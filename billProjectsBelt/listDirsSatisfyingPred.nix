{ pkgsLib }:
{ dir, pred }:
rec {
  recursiveListing = pkgsLib.filesystem.listFilesRecursive dir;
  keepElmsSatisfyingPred = builtins.filter pred recursiveListing;
  __output = keepElmsSatisfyingPred;
}
