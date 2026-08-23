let
    withDebug = total:
      if builtins.hasAttr "__activateDebug" total then
        (if total.__activateDebug then
          total
        else if builtins.hasAttr "__output" total then
          total.__output
        else
          throw "withDebug: attribute set lacks `__output` attribute")
      else if builtins.hasAttr "__output" total then
        total.__output
      else
        throw "withDebug: attribute set lacks `__output` attribute";
    dImport = filepath: args: withDebug (import filepath args);
in dImport
