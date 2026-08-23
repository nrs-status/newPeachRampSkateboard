{ pkgsLib }:
rec {
  dImport = import ./dImport.nix;
  importPairsOfDirPath = dImport ./importPairsOfDirPath.nix { inherit pkgsLib; };
  importPairsOfDirPathNoInput = dImport ./importPairsOfDirPathNoInput.nix { inherit pkgsLib; };
  listDirsSatisfyingPred = dImport ./listDirsSatisfyingPred.nix { inherit pkgsLib; };
}
