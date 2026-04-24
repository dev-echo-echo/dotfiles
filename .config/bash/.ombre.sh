function ombre(){
    text=$1
    sr=$(( RANDOM % 256 ))
    sg=$(( RANDOM % 256 ))
    sb=$(( RANDOM % 256 ))

    er=$(( RANDOM % 256 ))
    eg=$(( RANDOM % 256 ))
    eb=$(( RANDOM % 256 ))

    n=${#text}
    if (( n <= 1 )); then   
        n=2
    fi

    gradient=""
    for ((i=0; i<${#text}; i++)); do
        R=$(echo "scale=6; $sr + ($er - $sr) * ($i / ($n - 1) )" | bc -l)
        G=$(echo "scale=6; $sg + ($eg - $sg) * ($i / ($n - 1) )" | bc -l)
        B=$(echo "scale=6; $sb + ($eb - $sb) * ($i / ($n - 1) )" | bc -l)
        intR=${R%%.*}
        intG=${G%%.*}
        intB=${B%%.*}
        colorfull_char="\033[38;2;${intR};${intG};${intB}m${text:$i:1}\033[0m"
        gradient+="$colorfull_char"
    done
}
