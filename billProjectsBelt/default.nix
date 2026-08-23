{ pkgsLib }:
{
  withDebug = import ./withDebug.nix;
  importPairsOfDirPath = x: import ./importPairsOfDirPath.nix { inherit pkgsLib; } x;
  listPathsSatisfyingPred = x: import ./listPathsSatisfyingPred.nix { inherit pkgsLib; } x ;
}
