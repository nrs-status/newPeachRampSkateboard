# creates an attribute set whose keys are a file name without a suffix, and whose values are that file imported
{ pkgsLib }:
{ pred, # used to filter paths
dirPath, # used to list paths recursively
inputsForImportPairs }: 
(import ./withDebug.nix) rec {
  filesList = (import ./listDirsSatisfyingPred.nix { inherit pkgsLib; }) {
    dir = dirPath;
    inherit pred;
  };
  mkImportPair = path: {
    name = pkgsLib.removeSuffix ".nix" (baseNameOf path);
    value = import path inputsForImportPairs;
  };
  importPairList = map mkImportPair filesList;
  __output =
    builtins.foldl' (acc: next: acc // { ${next.name} = next.value; }) { }
    importPairList;
}
