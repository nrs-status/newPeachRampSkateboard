#creates an attribute set whose keys are a file name without a suffix, and whose values are that file imported
{ pkgsLib }:
dirPath:  #dirPath will be used to list subpaths recursively
rec {
  filesList = (import ./listDirsSatisfyingPred.nix { inherit pkgsLib; }) {
    dir = dirPath;
    pred = pkgsLib.hasSuffix "default.nix";
  };
  mkImportPair = path: {
    name = baseNameOf (dirOf path);
    value = import path;
  };
  importPairList = map mkImportPair filesList;
  __output = builtins.foldl' (acc: next: acc // { ${next.name} = next.value; }) {} importPairList;
}
