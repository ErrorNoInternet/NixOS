{ inputs, lib, ... }:

{
  nix.registry =
    lib.mapAttrs'
      (name: flake:
        let
          name' = if (name == "self") then "config" else name;
        in
        lib.nameValuePair name' { inherit flake; })
      inputs;
}
