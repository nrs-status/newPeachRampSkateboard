{ pkgsLib }:
rec {
  withDebug = import ./withDebug.nix;
  importPairsOfDirPath = x: import ./importPairsOfDirPath.nix { inherit pkgsLib; } x;
  importPairsOfDirPathNoInput = x: import ./importPairsOfDirPathNoInput.nix { inherit pkgsLib; } x;
  listDirsSatisfyingPred = x: import ./listDirsSatisfyingPred.nix { inherit pkgsLib; } x ;
}
