my_arr=()
echo "${#my_arr[@]}"
if [[ "${#my_arr[@]}" != 0 ]]; then
    echo "array is not empty"
else
    echo "empty"
fi
