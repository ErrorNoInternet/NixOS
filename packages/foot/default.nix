{
  fetchFromGitea,
  foot,
  ...
}:
foot.overrideAttrs (old: {
  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "dnkl";
    repo = "foot";
    rev = "3e6f0e63f3027f19a83c6a2ddcf52018d30f2751";
    hash = "sha256-hJIA8F5sQdviIEQs72MQaYomlV0pazkPdNsUReADYTo=";
  };
  patches =
    (old.patches or [])
    ++ [
      ./fix-font-misalignment.patch
      ./fullscreen-transparency.patch
    ];
})
