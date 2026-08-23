{ pkgsLib }:
{
  withDebug = import ./withDebug.nix;
  importPairsOfDirPath = x: import ./importPairsOfDirPath.nix { inherit pkgsLib; } x;
  listFilesSatisfyingPred = x: import ./listFilesSatisfyingPred.nix { inherit pkgsLib; } x ;
}
