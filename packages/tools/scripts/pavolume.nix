{
  writeShellApplication,
  pulseaudio,
}:
writeShellApplication {
  name = "pavolume";
  runtimeInputs = [pulseaudio];
  text = ''
    sink="@DEFAULT_SINK@"

    current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | sed -n "s|Volume: front-left:.*/\(.*\)%.*/.*dB|\1|p" | tr -d ' ')
    if [[ $1 == "up" ]]; then
      if [[ $((current_volume + 5)) -gt 100 ]]; then
        pactl set-sink-volume $sink 100%
      else
        pactl set-sink-volume $sink +5%
      fi
    elif [[ $1 == "down" ]]; then
      pactl set-sink-volume $sink -5%
    elif [[ $1 == "toggle" ]]; then
      pactl set-sink-mute $sink toggle
    fi
  '';
}
