{ light, writeShellApplication }:
writeShellApplication {
  name = "brightness";
  runtimeInputs = [ light ];
  text = ''
    if [[ $1 == "up" ]]; then
      for _ in {0..5}; do
        light -A 0.6
        sleep 0.025s
      done
    elif [[ $1 == "down" ]]; then
      for _ in {0..5}; do
        light -U 0.6
        sleep 0.025s
      done
    fi
  '';
}
