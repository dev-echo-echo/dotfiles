function repeat() {
    local str=$1
    local n=$2
    for ((i=0; i<n; i++)); do
        printf "$str"
    done

}

#echo "╭─" "─ * len(text)"  "─╮" 
