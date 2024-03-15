{
  pkgs,
  writeShellApplication,
  ...
}:
writeShellApplication {
  name = "tbw";
  text = ''
    set +o errexit
    set +o nounset
    set +o pipefail

    attribute="Written"
    precision=3
    smartctl_errors=true

    usage() {
      echo "usage: $0 [OPTION]... DEVICE..."
      echo -e "display the amount of data written to or read from a drive\n"
      echo -e "\t-r\tdisplay read instead of written"
      echo -e "\t-b\tdisplay bytes instead of terabytes"
      echo -e "\t-p\tspecify terabyte precision"
      echo -e "\t-i\tignore smartctl exit code"
      exit 1
    }

    while getopts ":rbip:" option; do
      case $option in
        r) attribute="Read" ;;
        b) unit="bytes" ;;
        p) precision=$OPTARG ;;
        i) smartctl_errors=false ;;
        *) usage ;;
      esac
    done

    shift $((OPTIND-1))

    if [ $# -eq 0 ]; then
      usage;
    fi

    for device in "$@"; do
      smartctl_output=$(${pkgs.smartmontools}/bin/smartctl -x "$device")
      if [[ $? -eq 1 || $? -eq 2 ]] && [[ $smartctl_errors = true ]]; then
        echo "[$device] error: unable to run smartctl on device!" >&2
        continue
      fi

      sector_size=$(echo "$smartctl_output" | grep -E "Sector Sizes?:" | sed -n "s/.*\(\b[0-9]\+\) bytes logical.*/\1/p")
      if [[ -z "$sector_size" ]]; then
        echo "[$device] error: unable to parse logical sector size!" >&2
        continue
      fi

      value=$(echo "$smartctl_output" | grep "Logical Sectors $attribute" | sed -n "s/.*\b\([0-9]\+\)\b.*Logical Sectors $attribute$/\1/p")
      if [[ -z "$value" ]]; then
        echo "[$device] warning: unable to parse "Logical Sectors $attribute" value! trying alternative method..." >&2
        value=$(echo "$smartctl_output" | grep Total_LBAs_$attribute | sed -n "s/.*\(\b[0-9]\+\)[^0-9]*$/\1/p")
        if [[ -z "$value" ]]; then
          echo "[$device] error: unable to parse \"Total_LBAs_$attribute\"!" >&2
          continue
        fi
      fi

      if bytes=$(echo "$value * $sector_size" | ${pkgs.bc}/bin/bc); then
        if [[ unit -eq "bytes" ]]; then
          echo "$device: $bytes bytes"
        else
          output=$(echo "scale=$precision; $bytes / 1000 / 1000 / 1000 / 1000" | ${pkgs.bc}/bin/bc -l)
          if [[ $output =~ "error" ]]; then
            echo "[$device] bc error: $output" >&2
          else
            echo "$device: $output terabytes"
          fi
        fi
      else
        echo "[$device] bc error: unable to multiply \"$value\" by \"$sector_size\"!" >&2
        continue
      fi
    done
  '';
}
