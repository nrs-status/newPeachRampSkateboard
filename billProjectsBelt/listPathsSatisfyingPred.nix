{ pkgsLib }:
{ dir ? ./., pred, excludeDirectories ? false }:
(import ./withDebug.nix) rec {
  fileListing = pkgsLib.filesystem.listFilesRecursive dir;
  totalListing = if excludeDirectories then fileListing else fileListing ++ pkgsLib.lists.unique (map dirOf fileListing);
  __output = builtins.filter pred totalListing;
  
}
