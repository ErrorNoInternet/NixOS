{
    home.file = {
        "scripts/brightness.sh" = {
            executable = true;
            text = ''
#!/usr/bin/env sh

if [[ $1 == "up" ]]; then
    for i in {0..5}; do
        light -A 0.6
        sleep 0.025s
    done
elif [[ $1 == "down" ]]; then
    for i in {0..5}; do
        light -U 0.6
        sleep 0.025s
    done
fi
'';
        };
    };
}
