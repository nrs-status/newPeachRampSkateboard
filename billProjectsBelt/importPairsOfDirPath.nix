# creates an attribute set whose keys are a file name without a suffix, and whose values are that file imported
{ pkgsLib }:
{ pred ? null, # used to filter paths
dirPath, # used to list paths recursively
inputsForImportPairs ? null
, # supposes null iff doesn't take an argument. if you need a function that can pass null as an argument make a separate function
 }:
(import ./withDebug.nix) rec {
  filesList = (import ./listFilesSatisfyingPred.nix { inherit pkgsLib; }) {
    dir = dirPath;
    pred = if pred == null then _: true else pred;
  };
  mkImportPair = path: {
    name = pkgsLib.removeSuffix ".nix" (baseNameOf path);
    value = if inputsForImportPairs == null then
      import path
    else
      import path inputsForImportPairs;
  };
  importPairList = map mkImportPair filesList;
  __output =
    builtins.foldl' (acc: next: acc // { ${next.name} = next.value; }) { }
    importPairList;
}
