for NAME in "${!CONFIG_DIR_NAME[@]}"; do
    printf "key = [%s]\n" "$NAME"
    printf "length = %d\n" "${#NAME}"
    #echo "$key -> ${CONFIG_DIR_NAME[$key]}"
    if [[ "green"=="$KEY" ]]; then   # this is always true.
        echo -e "true key: $KEY"
        false && echo "this should not print"
        true && echo "this should  print"
      #  echo $TARGET
      #  link "$key" "$SOURCE/$key" "$HOME"
    #else
        #link "$key" "$SOURCE/$key" "$TARGET"
    fi
done
