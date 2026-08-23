{ pkgsLib }:
rec {
  dImport = import ./dImport.nix;
  importPairsOfDirPath = x: dImport ./importPairsOfDirPath.nix [ { inherit pkgsLib; } x ];
  importPairsOfDirPathNoInput = x: dImport ./importPairsOfDirPathNoInput.nix [ { inherit pkgsLib; } x ];
  listDirsSatisfyingPred = x: dImport ./listDirsSatisfyingPred.nix [ { inherit pkgsLib; } x ];
}
