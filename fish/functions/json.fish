function json --argument-names 'filename'
  if test -n "$filename"
    cat $filename | python3 -m json.tool
  else
    python3 -m json.tool
  end
end

