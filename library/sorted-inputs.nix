let
  inherit
    ((import <nixpkgs> {}).lib)
    add
    attrNames
    elemAt
    foldl'
    genList
    length
    replaceStrings
    sort
    toLower
    trace
    ;

  inherit (import ../flake.nix) inputs;
  simplify = replaceStrings ["-" "_"] ["" ""];
  inputsSorted =
    sort
    (a: b: a.key < b.key)
    (map
      (n: let
        pos = builtins.unsafeGetAttrPos n inputs;
      in
        assert pos == null -> throw "flake input ${n} is malformed"; {
          name = n;
          inherit (pos) line;
          key = toLower (simplify n);
        })
      (attrNames inputs));
  before = {
    name,
    line,
    key,
  }:
    foldl'
    (acc: n:
      if
        n.key
        < key
        && (acc == null || n.key > acc.key)
        && (n.name != acc.name)
        && (n.line != acc.line)
      then n
      else acc)
    null
    inputsSorted;
  errors =
    foldl' add 0
    (map
      (i: let
        a = elemAt inputsSorted i;
        b = elemAt inputsSorted (i + 1);
        lim = let
          t = before a;
        in
          if t == null
          then "the initial {"
          else t.name;
      in
        if a.line >= b.line
        then
          trace
          ("flake input ${a.name} (line ${toString a.line}) should be listed "
            + "after ${lim}, not after ${b.name} (line ${toString b.line})")
          1
        else 0)
      (genList (i: i) (length inputsSorted - 1)));
in
  assert errors == 0; "all good!"
